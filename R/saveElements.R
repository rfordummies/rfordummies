

#' Saves a copy of the periodic table of elements as excel or csv file.
#' 
#' @param outfile File name
#' @param type Either excel or csv
#' 
#' @importFrom utils data write.csv
#' @importFrom openxlsx write.xlsx
#' 
#' @export
#' 
#' @examples 
#' saveElements(file.path(tempdir(), "elements.xlsx"))
#' saveElements(file.path(tempdir(), "elements.csv"), type = "csv")
#' list.files(tempdir(), pattern = "xlsx|csv", full.names = TRUE)
#' 
saveElements <- function(outfile, type = c("excel", "csv")){
  type <- match.arg(type)
  dummies_env <- new.env()
  data(elements, package = "rfordummies", envir = dummies_env)
  elements <- dummies_env[["elements"]]
  switch(
    type, 
    excel = {
      openxlsx::write.xlsx(elements, file = outfile)
    },
    csv = {
      utils::write.csv(elements, file = outfile, row.names = FALSE)
    })
}



