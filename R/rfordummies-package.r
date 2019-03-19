#' A package to accompany the book "R for Dummies".
#' 
#' This package contains all the code examples in the book 'R for Dummies' (2nd edition) by Andrie de Vries and Joris Meys.
#' 
#' To print the sample code for every chapter:
#' 
#' * [ch1()]
#' * [ch2()]
#' * etc.
#' 
#' To print the table of contents:
#' 
#' * [toc()]
#' 
#' To save the `elements` data frame to either excel or csv format, use:
#' 
#' * [saveElements()]
#'  
#'
#' @name rfordummies
#' @docType package
#' @references de Vries, A. , & Meys, J. (2012). <i>R for dummies</i>. Chichester: Wiley. \url{https://rfordummies.com/}, ISBN-13: 978-1119962847.
#' @docType package
NULL

#' Periodic table of elements.
#' 
#' A data set containing properties of the periodic table of elements.
#' 
#' \itemize{
#'   \item Atomic.no
#'   \item Name  
#'   \item Symbol
#'   \item Group
#'   \item Period
#'   \item Block
#'   \item State.at.STP
#'   \item Occurrence
#'   \item Description
#' }
#'
#' @format A data frame with 118 rows and 9 variables
#' 
#' @name elements
#' @docType data
#' @source \url{http://en.wikipedia.org/wiki/Periodic_table}
#' @keywords data
NULL