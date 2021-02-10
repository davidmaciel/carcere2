
get_exec_dates <- function(x){
pats <- list(
exec_prov_num = "Execu\u00e7\u00e3o Provis\u00f3ria\r\n\\s+N[\u00ba\u00b0oe]\\s*(\\d{4}\\.\\d{3}\\.\\d{6}\\s*-\\s*\\d{1})",
exec_num = "Processo:\\s*(\\d{7}\\-\\d{2}\\.\\d{4}\\.\\d{1}\\.\\d{2}\\.\\d{4})",
procrim_num = "N\u00ba\\s*do\\s*Proc\\.\\s*na\\s*V\\.O\\.:\\s*(\\d{7}\\-\\d{2}\\.\\d{4}\\.\\d{1}\\.\\d{2}\\.\\d{4})",
vara = "\\d{7}\\-\\d{2}\\.\\d{4}\\.\\d{1}\\.\\d{2}\\.\\d{4}\\s*V\\.O\\.:\\s*(.+)?\r\n",
delito = "Data\\s*do\\s*Delito:\\s*(\\d{2}[/1]\\d{2}[/1]\\d{4})",
denuncia = "Data\\s*da\\s*Den\u00fancia:\\s*(\\d{2}[/1]\\d{2}[/1]\\d{4})",
receb_denun = "Data\\s*Receb\\.\\s*Den\u00fancia:\\s*(\\d{2}[/1]\\d{2}[/1]\\d{4})",
sentenca = "Data\\s*da\\s*Sent\\.\\s*Cond\\.:\\s*(\\d{2}[/1]\\d{2}[/1]\\d{4})"
)
purrr::map_dfc(pats, extract_var, x = x) %>%
  dplyr::mutate(dplyr::across(
    tidyselect:::where(is.character),
    clean_string))

}
