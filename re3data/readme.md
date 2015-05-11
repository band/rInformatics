# R3Data: experimenting with dataBib and r3data combined data repo API

 1. download repository list

 ```
$ wget http://service.re3data.org/api/beta/repositories

$ mv repositories repositories.xml
$ more repositories.xml
```

 2. download a specific repository record

`$ wget http://service.re3data.org/api/beta/repository/100000020`

 3. extract repositoryURL from repository record

`$ grep repositoryURL 100000020`

4. more aggressive download and cleanup attempt

```
$ for i in $(head -99 repoIDlist.txt); do wget -O - http://service.re3data.org/api/beta/repository/$i |grep 'repositoryURL' >> repoURL1.txt; done

$ sed -e :a -e 's/<[^>]*>//g;/</N;//ba' repoURL1.txt | sed 's/^[ \t]*//' > repoURL099.txt
```



