# url <- "data-raw/leandro.pdf"
# tfd <- get_tfd(url)
recorta_mov <- function(tfd){
  classe <- "[\\d\\w:space::punct:\r\n\\s-\\'.\\/\\(\\),\u00a7\\*\u00aa\u00ba\u00b0\u0095]"
  tfd <- stringr::str_remove_all(tfd, '"')
  pat <- paste0("Movimenta\u00e7\u00e3o\\:?(",
                classe, "+)?(\u00cdndice)")
  mov <- stringr::str_match(tfd,pat)[,2] %>%
    str_remove_all("^\\s?\r\n\\s?|\\s?\r\n\\s?$") %>%
    str_split("\r\n") %>%
    pluck(1) %>% str_trim() %>%
    str_split_fixed("\\s{3,}",6)
  tib <- tibble::as_tibble(mov[-1,])
  names(tib) <- mov[1,]
  tib

}
