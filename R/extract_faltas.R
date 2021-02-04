
################
recorta_falta <- function(x){
  classe <- "[\\d\\w:space::punct:\r\n\\s-\\'.\\/\\(\\),\u00a7\\*\u00aa\u00ba\u00b0\u0095]"
  x <- stringr::str_remove_all(x, '"')
  pat <- paste0("Faltas Disciplinares\\:?(",
                classe, "+)?(Prontu\u00e1rio emitido|Regalias|relatorioTranscricaoDisciplinar|PROC)")
  faltas <- stringr::str_match(x,pat)[,2]
  if(grepl("Regalias|Benef\u00edcios",faltas)){
    stringr::str_remove(faltas, paste0("Regalias", classe, "+"))
  } else {
    faltas
  }
}


extract_falta <- function(tfd){
  rec <- recorta_falta(tfd)
classe <- "[\\d\\w:space::punct:\r\n\\s-\\'.\\/\\(\\),]"
pats <- list(
unidade = "Unidade:\\s+(\\w+)\\s",
n_proc = "Nº\\s?[Pp]rocesso:\\s*(\\d+)\\s",
tipo_falta = "Tipo\\s?Falta:\\s(.+)?\r\n",
data_falta = "Data\\s*?Falta:\\s*(\\d{2}/\\d{2}/\\d{4})",
descr_falta = paste0(
  "Data\\s*?Falta:\\s*\\d{2}/\\d{2}/\\d{4}",
  "\\s*",
  "Descri\u00e7\u00e3o:\\s(.+)?\r\n"),
data_pnc = "Data\\s*Puni\u00e7\u00e3o:\\s*((\\d{2}/\\d{2}/\\d{4})?)",
desc_pnc = paste0(
  "Data\\s*Puni\u00e7\u00e3o:\\s*(\\d{2}/\\d{2}/\\d{4})?",
  "\\s*",
  "Descri\u00e7\u00e3o:\\s((.*)?\r\n)?"),
obs = paste0("Obs?erva\u00e7\u00e3o:(\\s?",
                  classe,
             "*?(\r\n|Unidade:|Regalias|$))")

)
purrr::map_dfc(pats, extract_all_var, x = rec) %>%
  dplyr::mutate(dplyr::across(dplyr::everything(), clean_string))
}
