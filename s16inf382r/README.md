# rInformatics: Exercises using rOpenSci informatics packages

## Searching arXiv and PLoS

The goal of this exercise is to use two of the rOpenSci R packages
that search the arXiv and PLoS journal repositories. The exercise has
three parts.

1. Using the documentation for the R aRxiv and rplos libraries search
the repositories for items containing the following information
science terms:
	- data, dataset, 'data collection'
	- 'data preservation'
	- 'data provenance'
	- 'data quality'
	- 'data repository', 'data storage'
	- 'semantic web'
	- 'linked data'
	...

1.1. The library rplos has two functions that seem worth starting
with: 'searchplos' (kinda general search) and 'plosword' (search by
keyword). 'plosword' can generate a bar graph of the results of the
keyword search.

To see all the functions in rplos (or any library) you can use these
commands:

     ls(getNamespace('rplos'),all.names=TRUE)
     ?rplos

1.2. The library aRxiv provides a search function 'arxiv_search'. To
find the first 10 articles with the string "linked data" in their
titles use this command:

      arxiv_search(query= 'ti:"linked data"')
      [Note: double quotes needed in this library to search for phrases.]


2. Capture the commands you use so you can reproduce the results, and
share the steps you took. If you are using RStudio commands can be
copied from the "History" window.


3. If these exercises do not provide enough interest, I suggest that
you look at some of the existing rOpenSci libraries such as
  - the R interface for the World Bank climate data
    https://github.com/ropensci/rWBclimate

A full list of rOpenSci packages can be found here:
  http://ropensci.org/packages/

4. No matter what packages you examine provide an assessment of your
experience with the exercise. Where did you have breakdowns, or run
into trouble using the libraries and their functions? Where did you
find or notice something interesting about the functions, the data,
the results? Maybe R is not the best way to look at these collections?
Be critical and provide reasons for your opinions.
