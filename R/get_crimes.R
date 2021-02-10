

get_crimes <- function(x){
x1 <- stringr::str_subset(x, "Condena\u00e7\u00e3o") %>% .[1] %>%
  stringr::str_extract(paste0("Condena\u00e7\u00e3o", classe, "+?Multa"))
exec_prov_num <- "Execu\u00e7\u00e3o Provis\u00f3ria\r\n\\s+N[\u00ba\u00b0oe]\\s*(\\d{4}\\.\\d{3}\\.\\d{6}\\s*-\\s*\\d{1})"
exec_num <- "Processo:\\s*(\\d{7}\\-\\d{2}\\.\\d{4}\\.\\d{1}\\.\\d{2}\\.\\d{4})"

if(grepl("Capitula\u00e7\u00e3o",x1)){
  crime1 <- "(?s)Capitula\u00e7\u00e3o:?(.+?)Multa"
  tibble::tibble(
  "exec_prov_num" = extract_var(x, exec_prov_num),
  "exec_num" = extract_var(x, exec_num),
  "crimes" =  extract_var(x1, crime1) %>% clean_string()
  )
} else{
    crime2 <- "(?s)(?:Condena\u00e7\u00e3o:|\\d{1}\r\n)(.+?)Pena"
    tibble::tibble(
      "exec_prov_num" = extract_var(x, exec_prov_num),
      "exec_num" = extract_var(x, exec_num),
      "crimes" =  extract_all_var(x1,crime2) %>% clean_string()
    )

    }
}


