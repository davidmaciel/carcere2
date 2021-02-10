

subset_exec <- function(file){
  pdf <- pdftools::pdf_text(file)
  stringr::str_subset(pdf,"Execu\u00e7\u00e3o Provis\u00f3ria")
}

get_exec_num <- function(x){
  pat <- "Execu\u00e7\u00e3o Provis\u00f3ria\r\n\\s+N\u00ba\\s*(\\d{4}\\.\\d{3}\\.\\d{6}-\\d{1})"
  stringr::str_match(x, pat)[,2] %>%
    subset(!is.na(.)) %>% unique()
}

get_n_distinct_exec <- function(x){
  pat <- "Execu\u00e7\u00e3o Provis\u00f3ria\r\n\\s+N\u00ba\\s*(\\d{4}\\.\\d{3}\\.\\d{6}-\\d{1})"
  stringr::str_match(x, pat)[,2] %>%
    subset(!is.na(.)) %>% unique() %>% length()
}

get_exec <- function(x, exec_num) {
  pat <- paste0(
    "Execu\u00e7\u00e3o Provis\u00f3ria\r\n\\s+N\u00ba\\s*",
    exec_num)
  stringr::str_subset(x, exec_num)
}

get_exec_pages <- function(x, exec_num){
  exec <- get_exec(x, exec_num)
  pat <- "P\u00e1g\\s*:\\s*\\d{1}"
  stringr::str_match(exec, pat)
}
