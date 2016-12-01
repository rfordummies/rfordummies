rfordummies
===========


[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
master: [<img src="https://travis-ci.org/andrie/rfordummies.svg" alt="Build Status" />](https://travis-ci.org/andrie/rfordummies)
dev: [<img src="https://travis-ci.org/andrie/rfordummies.svg?branch=dev" alt="Build Status" />](https://travis-ci.org/andrie/rfordummies) 
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/rfordummies)](http://cran.r-project.org/package=rfordummies)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/rfordummies)](http://www.r-pkg.org/pkg/rfordummies)

# Overview

`rfordummies` is an R package to accompany the book "R for Dummies"

The package contains the following functions:

* `toc()` - prints table of contents of the book
* `ch1()` - prints all code examples of ch1
* `ch2()` - prints all code examples of ch2
*  ...
* `ch20()` - prints all code examples of ch20

Since each of the functions `ch1()` to `ch20()` also contains the code examples as function examples, you can do the following to run all examples of a given chapter:

    example("ch20", "rfordummies")


# Installation

You can install `rfordummies` using:

    library("devtools")
    install_github("rfordummies", "andrie")
