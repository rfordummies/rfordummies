### Code to automatically generate ch() functions

#' Read cleaned chapter code from /inst/scripts/2-clean
#' 
#' @param ch Chapter number
#' @keywords Internal
readExampleFile <- function(ch){
  text <- system.file(paste0("inst/scripts/2-clean/", ch), package = "rfordummies")
  readLines(text)
}


#' Generate code and example for single chapter.
#' 
#' @param ch Chapter number
#' @keywords Internal
genChapter <- function(ch){
  chapter <- "#' Print examples of chapter <<x>>.
#' 
#' @export
#' @example /inst/scripts/2-clean/ch<<xx>>.R
ch<<x>> <- function(){
  text <- readExampleFile(\"ch<<xx>>.R\")
  cat(text, sep=\"\n\")
  invisible(text)
}

"
  if(!is.numeric(ch)) stop ("ch should be numeric")
  chapter <- gsub("<<x>>", sprintf("%s", ch), chapter)
  gsub("<<xx>>", sprintf("%02d", ch), chapter)
}

#' Generate code and examples for all chapters.
#' 
#' @param chapters Chapter numbers
#' @param path Path to package
#' @param file Name of file containing ch() functions
#' @keywords Internal
generateChapters <- function(chapters=1:20, path, file="R/chapters-auto.R"){
  sink(file.path(path, file))
  on.exit(sink())  
  for(i in chapters)cat(genChapter(i))
}

# .generateChapters(path="rfordummies")

