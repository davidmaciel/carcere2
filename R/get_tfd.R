#' Read file
#'
#' Reads a penal execution process pdf into R
#'
#' @param file path to a pdf file
#'
#' @return a string vector, where every string is a page in the process.
#' @export
#'
#' @examples
#' \dontrun{
#'   get_pdf("data-raw/fulano.pdf")
#' }
get_tfd <- function(file){
  assertthat::assert_that(grepl("pdf$",file), msg = "File is not readable")
  pdftools::pdf_text(file) %>%
    stringr::str_subset("Transcri\u00e7\u00e3o da Ficha Disciplinar") %>%
    organize_tfd() %>%
    collapse_tfd() %>%
    dplyr::last()
}
