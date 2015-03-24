# R3Data: experimenting with dataBib and r3data combined data repo API

 1. download repository list

 ```
$ wget http://service.re3data.org/api/beta/repositories

$ mv repositories repositories.xml
$ more repositories.xml
```

 2. download a specific repository record

`$ wget http://service.re3data.org/api/beta/repository/r3d100000020`

 3. extract repositoryURL from repository record

`$ grep repositoryURL r3d100000020`




