get_tfd <- function(file){
  assertthat::assert_that(
    assertthat::is.readable(file), msg = "File is not readable")
  pdftools::pdf_text(file) %>%
    stringr::str_subset("Transcrição da Ficha Disciplinar")
}
