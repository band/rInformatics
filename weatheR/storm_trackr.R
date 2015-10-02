library(plyr)
library(leaflet)
library(stringi)
library(htmltools)
library(RColorBrewer)

#storm <- readLines("http://weather.unisys.com/hurricane/atlantic/2015/ERIKA/track.dat")
#storm <- readLines("http://weather.unisys.com/hurricane/atlantic/2015/FRED/track.dat")
storm <- readLines("http://weather.unisys.com/hurricane/atlantic/2015/JOAQUIN/track.dat") 

storm_dat <- read.table(textConnection(gsub("TROPICAL ", "TROPICAL_", storm[3:length(storm)])), header=TRUE, stringsAsFactors=FALSE)

# make storm type names prettier
storm_dat$STAT <- stri_trans_totitle(gsub("_", " ", storm_dat$STAT))

# make column names prettier
colnames(storm_dat) <- c("advisory", "lat", "lon", "time", "wind_speed", "pressure", "status")

storm_dat$color <- as.character(factor(storm_dat$status, levels=c("Tropical Depression", "Tropical Storm", "Hurricane-1", "Hurricane-2", "Hurricane-3", "Hurricane-4", "Hurricane-5"), labels=(brewer.pal(7, "Reds"))))

# replace past position colors
storm_dat$color[strptime(storm_dat$time, format="%m/%d/%H") <= Sys.time()] <- "grey"

# make windspeeds useful for point sizes
storm_dat$wind_speed <- as.integer(storm_dat$wind_speed)
storm_dat$wind_speed[is.na(storm_dat$wind_speed)] <- 0

storm_dat$date <- strftime(strptime(storm_dat$time, format="%m/%d/%H"), '%m/%d %Hh')

# separate complete and intermediate advisories (assuming they come in pairs - TODO)
storm_dat$adv <- gsub("A", "", storm_dat$advisory)
storm_complete <- ddply(storm_dat, "adv", head, 1)
storm_complete <- storm_complete[order(storm_complete$date),]
storm_intermediate <- ddply(storm_dat, "adv", tail, 1)
storm_intermediate <- storm_intermediate[order(storm_intermediate$date),]


leaflet() %>% 
    addTiles() %>% 
    addWMSTiles(
        "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
        layers = "nexrad-n0r-900913",
        options = WMSTileOptions(format = "image/png", transparent = TRUE),
        attribution = "Weather data © 2012 IEM Nexrad"
    ) %>%
    addPolylines(data=storm_complete, ~lon, ~lat, color=~color, weight=1) %>% 
    addCircles(data=storm_complete, ~lon, ~lat, color=~color, fill=~color, radius=storm_dat$wind_speed*500,
               popup=~sprintf("<b>nAdvisory forecast %s (%s)</b><hr noshade size='1'/>
                              Position: %3.2f, %3.2f<br/>
                              Strength: <span style='color:%s'><strong>%s</strong></span><br/>
                              Wind: %s (knots)<br/>Pressure: %s",
                              htmlEscape(advisory), htmlEscape(date), htmlEscape(lon),
                              htmlEscape(lat), htmlEscape(color), htmlEscape(status), 
                              htmlEscape(wind_speed), htmlEscape(pressure))) %>%
    html_print