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


