# rInformatics: Exercises using rOpenSci informatics packages

The objectives of this assignment is to experiment with rOpenSci R
packages that focus on data access and analysis. One exercise uses
packages that search journal repositories. The second exercise uses a new
Hydrological Data Discovery Tools package to explore some aspects of
data analysis and processing that is available in R.

NOTE: if you run into any difficulty with installing or running the
tools please get in touch with me. Email is the best communication vehicle.

## Exercise 1: Searching arXiv and PLoS

The goal of this exercise is to use two of the rOpenSci R packages
that search the arXiv and PLoS journal repositories. The exercise has
three parts.

0.1. aRxiv tutorial is here: http://ropensci.org/tutorials/arxiv_tutorial.html
0.2. rplos tutorial is here: http://ropensci.org/tutorials/rplos_tutorial.html

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


Capture the commands you use so you can reproduce the results, and
share the steps you took. If you are using RStudio commands can be
copied from the "History" window.


## Exercise 2: R interface for the World Bank climate data

  https://github.com/ropensci/rWBclimate/blob/master/README.md

Pick one of the sections in the README.md file, and reproduce the
analysis in one of the examples. The sections include Global Climate
Model (GCM) data, Ensemble Model data, Historical data, and Mapping
climate data. Just pick one example.

The rWBclimate package needs to be installed from github using the
devtools. Here are the install commands I used in RStudio.

> devtools::install_github("ropensci/rWBclimate")
> library(rWBclimate)
> library(ggplot2)


## Document your work
No matter what packages you examine provide an assessment of your
experience with the exercise. Where did you have breakdowns, or run
into trouble using the libraries and their functions? Where did you
find or notice something interesting about the functions, the data,
the results? Maybe R is not the best way to look at these collections?

Be critical and provide reasons for your opinions.
