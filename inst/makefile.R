
# Install dependencies ----------------------------------------------------

local({
  dependencies <- c(
    "fortunes", 
    "stringr", 
    "sos", 
    "XLConnect", 
    "reshape2", 
    "ggplot2", 
    "foreign"
  )
  for (pkg in dependencies) {
    if (!require(pkg, character.only = TRUE)) install.packages(pkg)
  }
})



# Build package -----------------------------------------------------------


list.files(here::here("inst"))

source(here::here("inst/cleanscripts.R"), local = TRUE)
devtools::load_all()
.generateChapters()
devtools::document()
devtools::check_man()
devtools::check()
devtools::run_examples()



# help(package=rfordummies)

# Run all examples --------------------------------------------------------




# Run all the examples
library(foreach)
oldwd <- getwd()
foreach(
  ch = paste0("ch", 1:20),
  .errorhandling = "pass",
  .combine = c
) %do% {
  system.time(devtools::dev_example(ch))[[3]]
}
sapply(
  paste0("ch", 1:20),
  function(ch) {
    system.time(devtools::dev_example(ch))[[3]]
  }
)
setwd(oldwd)


# Run specific examples ---------------------------------------------------


devtools::dev_example("ch1")

# add_travis(pkg)
# run_examples(pkg, start = "ch2")
devtools::run_examples("rfordummies", fresh = TRUE, start = "ch7")
devtools::run_examples("rfordummies", fresh = TRUE)



# Find non-ascii characters -----------------------------------------------


tools::showNonASCIIfile("rfordummies/inst/scripts/2-clean/ch13.R")
tools::showNonASCII


# Show manual -------------------------------------------------------------


showPDFmanual <- function(package, lib.loc = NULL) {
  path <- find.package(package, lib.loc)
  system(paste(
    shQuote(file.path(R.home("bin"), "R")),
    "CMD", "Rd2pdf",
    shQuote(path)
  ))
}

showPDFmanual("rfordummies")
