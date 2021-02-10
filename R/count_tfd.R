count_tfd <- function(x){
  assertthat::assert_that(is.character(x), msg = "X isn't a string vector")
  pat <- "Ref\\.\\smov\\.\\s\\d{1,4}\\.\\d"
  stringr::str_extract(x, pat) %>% unique() %>%
    length()
}

get_ref_mov <- function(x){
  assertthat::assert_that(is.character(x), msg = "X isn't a string vector")
  pat <- "Ref\\.\\smov\\.\\s\\d{1,4}\\.\\d"
  stringr::str_extract(x, pat) %>% unique()
}

organize_tfd <- function(x){
  assertthat::assert_that(is.character(x), msg = "X isn't a string vector")
  refs <- get_ref_mov(x)
  purrr::map(refs, stringr::str_subset, string = x)
}

collapse_tfd <- function(x){
  assertthat::assert_that(is.list(x),
                          msg = "X must be a list made with organize_tfd")
  purrr::map(x, stringr::str_c, collapse = "\r\n")
}

get_tfd_date <- function(x){
  assertthat::assert_that(is.character(x), msg = "X isn't a string vector")
  pat <- "(\\d{2}/\\d{2}/\\d{4}):"
  stringr::str_match(x,pat) %>% .[1,2]
}

get_proc_number <- function(x){
  assertthat::assert_that(is.character(x), msg = "X isn't a string vector")
  pat <- "Processo:\\s*(\\d{7}-\\d{2}\\.\\d{4}\\.\\d\\.\\d{2}\\.\\d{4})"
  str_match(x, pat) %>% .[1,2]
}

extract_var <- function(x, pat){
  stringr::str_match(x,pat)[,2] %>%
    subset(!is.na(.)) %>% .[1]
}

extract_all_var <- function(x, pat){
  stringr::str_match_all(x,pat) %>%
    purrr::pluck(1) %>%
    .[,2] %>% subset(!is.na(.))
}

interp_str <- function(x){
  #numero de celulas com valores
  n_valor <- str_detect(x, "") %>% sum()
  n_sem_valor <- 6-n_valor
  #ultima celula valida
  last_cel <- x[n_valor]
  p_data <- "\\d{2}/\\d{2}/\\d{4}"
  if(n_valor >=5|(n_valor==4 & str_detect(last_cel, p_data))){
    return(x)
  } else {
    c(x[1:2], "", x[3], "", x[4])
  }

}

clean_string <- function(x){
  x %>% stringr::str_trim() %>%
    stringr::str_squish()
}
