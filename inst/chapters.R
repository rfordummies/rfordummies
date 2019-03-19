### Code to automatically generate ch() functions



# Generate code and example for single chapter.
#
#  ch Chapter number
.genChapter <- function(ch) {
  chapter <- c(
    "Print examples of chapter <<x>> of 'R for Dummies'.",
    "",
    "To print a listing of all examples of a chapter, use \\code{ch<<x>>()}. ",
    "To run all the examples of \\code{ch<<x>>()}, use \\code{example(ch<<x>>)}.",
    "@export",
    "@rdname ch<<xx>>",
    "@family Chapters",
    "@seealso \\code{\\link{toc}}",
    "@example inst/scripts/2-clean/ch<<xx>>.R",
    ""
  )

  chapter <- paste0("#' ", chapter, collapse = "\n")
  chapter <- sprintf(
    "%s\n%s", chapter,
    "ch<<xx>> <- function(){
      text <- .readExampleFile(\"ch<<xx>>.R\")
      cat(text, sep='\n')
      invisible(text)
    }"
  )
  chapterExtra <- "
#' @export
#' @aliases ch<<xx>>
#' @rdname ch<<xx>>
ch<<x>> <- ch<<xx>>
"
  if (!is.numeric(ch)) stop("ch should be numeric")
  chapter <- gsub("<<x>>", sprintf("%s", ch), chapter)
  out1 <- gsub("<<xx>>", sprintf("%02d", ch), chapter)

  if (ch < 10) {
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
.generateChapters <- function(chapters = 1:20,
                              path = here::here("R"),
                              file = here::here("R/chapters-auto.R")) {
  z <- do.call(
    paste,
    lapply(chapters, .genChapter),
  )
  writeLines(z, file)
}

.generateChapters()
