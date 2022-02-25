if (interactive() || is.na(Sys.getenv('NOT_CRAN', unset = NA)) ) {
# Chapter 20 - Ten Tips on Working with Packages

## Poking Around the Nooks and Crannies of CRAN

options("repos" = c(CRAN = "https://cran.ma.imperial.ac.uk/"))

## Finding Interesting Packages

## Installing Packages

\dontrun{
install.packages("fortunes")
}

## Loading Packages

library("fortunes")

## Reading the Package Manual and Vignette

library(help=fortunes)
\dontrun{
vignette("fortunes")
}

## Updating Packages

\dontrun{
update.packages()
}

## Unloading Packages

search()
detach(package:fortunes, unload=TRUE)

## Forging Ahead with R-Forge

\dontrun{
install.packages("data.table", repos="https://R-Forge.R-project.org")
}

## Conducting Installations from BioConductor

\dontrun{
source("https://bioconductor.org/biocLite.R")
}

## Reading the R Manual

}
