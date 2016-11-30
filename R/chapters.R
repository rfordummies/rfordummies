### Code to automatically generate ch() functions

# Read cleaned chapter code from /inst/scripts/2-clean
# 
#  ch Chapter number
.readExampleFile <- function(ch){
  text <- system.file(paste0("scripts/2-clean/", ch), package = "rfordummies")
  readLines(text)
}


# Generate code and example for single chapter.
# 
#  ch Chapter number
.genChapter <- function(ch){
  chapter <- c(
    "Print examples of chapter <<x>> of 'R for Dummies'.",
    "",
    "To print a listing of all examples of a chapter, use \\code{ch<<x>>()}. ",
    "To run all the examples of \\code{ch<<x>>()}, use \\code{example(ch<<x>>)}.",
    "@export",
    "@rdname ch<<xx>>",
    "@family Chapters",
    "@seealso \\code{\\link{toc}}",
    "@example inst/scripts/2-clean/ch<<xx>>.R"
  )
  
  chapter <- paste0(
    paste0("#' ", chapter, collapse ="\n"),
    "ch<<xx>> <- function(){
    text <- .readExampleFile(\"ch<<xx>>.R\")
    cat(text, sep=\"\n\")
    invisible(text)
}"
  )
chapterExtra <- "
#' @export
#' @aliases ch<<xx>>
#' @rdname ch<<xx>>
ch<<x>> <- ch<<xx>>
"
  if(!is.numeric(ch)) stop ("ch should be numeric")
  chapter <- gsub("<<x>>", sprintf("%s", ch), chapter)
  out1 <- gsub("<<xx>>", sprintf("%02d", ch), chapter)
  
  if(ch < 10){
    chapterExtra <- gsub("<<x>>", sprintf("%s", ch), chapterExtra)
    out2 <- gsub("<<xx>>", sprintf("%02d", ch), chapterExtra)
  } else {
    out2 <- ""
  }
  sprintf("%s\n%s\n\n", out1, out2)
}

# Generate code and examples for all chapters.
# 
# @param chapters Chapter numbers
# @param path Path to package
# @param file Name of file containing ch() functions
# @keywords Internal
.generateChapters <- function(chapters=1:20, path, file="R/chapters-auto.R"){
  sink(file.path(path, file))
  on.exit(sink())  
  for(i in chapters)cat(.genChapter(i))
}

# .generateChapters(path="rfordummies")

