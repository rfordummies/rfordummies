# Read cleaned chapter code from /inst/scripts/2-clean
# 
#  ch Chapter number
.readExampleFile <- function(ch){
  text <- system.file(paste0("scripts/2-clean/", ch), package = "rfordummies")
  readLines(text)
}
