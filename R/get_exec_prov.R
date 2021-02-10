

get_socio_exec_prov <- function(x){
pats <- list(
  exec_prov_num = "Execu\u00e7\u00e3o Provis\u00f3ria\r\n\\s+N[\u00ba\u00b0oe]\\s*(\\d{4}\\.\\d{3}\\.\\d{6}\\s*-\\s*\\d{1})",
  exec_num = "Processo:\\s*(\\d{7}\\-\\d{2}\\.\\d{4}\\.\\d{1}\\.\\d{2}\\.\\d{4})",
  nome = "Nome:(.+)?\r\n",
apelido = "Outros nomes\\/Alcunhas:(.+)?\r\n|Nome do Pai",
pai = "Nome do Pai:(.+)?\r\n",
mae = "Nome do M\u00e3e:(.+)?\r\n",
sexo = "Sexo:\\s*(Masculino|Feminino)",
raca = "Cor:([\\w\\s]+)?Estado Civil",
data_nasc = "Data\\s*Nasc\\.:\\s*(\\d{2}[/1]\\d{2}[/1]\\d{4})",
cidade_nasc = "Cidade\\/UF:(.+)?Pa\u00eds",
pais_nasc = "Pa\u00eds:(.+)?\r\n",
est_civil = "Estado Civil:(.+)?\r\n",
ensino = "Grau de Instru\u00e7\u00e3o:(.+)?Profiss",
profissao = "Profiss\u00e3\u006f:(.+)?\r\n"
)
purrr::map_dfc(pats, extract_var, x = x) %>%
  dplyr::mutate(dplyr::across(
    tidyselect:::where(is.character),
    clean_string)) %>%
  naniar::replace_with_na_all(condition = ~grepl("N\u00e3o Informado", .x)
  )
}


