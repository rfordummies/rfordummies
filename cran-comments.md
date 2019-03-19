## Test environments

* local Windows install, R 3.5.3
* ubuntu 14.04 (on travis-ci), using R-devel and R-release

## R CMD check results

0 errors | 0 warnings | 1 note

* This release fixes problems that caused the package to be archived on 2019-03-11. Specifically, the previous version contained a reference to `source("http://bioconductor.org/biocLite.R")`, which I removed.
