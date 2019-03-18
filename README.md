
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rfordummies <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->

[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![CRAN
status](https://www.r-pkg.org/badges/version/rfordummies)](https://cran.r-project.org/package=rfordummies)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/rfordummies)](http://www.r-pkg.org/pkg/rfordummies)
[![Travis build
status](https://travis-ci.org/andrie/rfordummies.svg?branch=master)](https://travis-ci.org/andrie/rfordummies)
<!-- badges: end -->

# Overview

`rfordummies` is an R package to accompany the book “R for Dummies”, by
Andrie de Vries and Joris Meys. The package contains functions to print
the table of contents as well as all the code samples for every chapter.

To print the table of contents, use:

``` r
toc()
```

To print the code of example for the chapters, use:

  - `ch1()` - prints all code examples of ch1
  - `ch2()` - prints all code examples of ch2
  - …
  - `ch20()` - prints all code examples of ch20

Since each of the functions `ch1()` to `ch20()` also contains the code
examples as function examples, you can do the following to run all
examples of a given chapter:

``` r
example("ch20", "rfordummies")
```

# Installation

You can install `rfordummies` using:

``` r
library("devtools")
install_github("rfordummies", "andrie")
```
