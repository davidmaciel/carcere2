
extract_socio <- function(tfd){
p_data_nasc <- "Data\\s{1,2}Nasc\\.\\:\\s{1,2}(\\d{2}/\\d{2}/\\d{4})"
p_nome <- "Nome\\:\\s{1,2}(.+)?\r\n"
p_pai <- "Filia\u00e7\u00e3o\\:(.*)?\r\n.*?\r\n"
p_mae <- "Filia\u00e7\u00e3o\\:.*?\r\n(.*)?\r\n"
p_cor <- "Cor\\:\\s+(\\w+)"
p_profissao <- "Profiss\u00e3o\\:\\s*(.+)?\r\n"
p_escolaridade <- "Instru\u00e7\u00e3o\\:\\s*(.+)?\\Estado"
p_estado_civil <- "Estado\\s{1,2}Civil\\:\\s*(.+)\r\n"
p_naturalidade <- "Naturalidade\\:\\s*(.+)?Nacionalidade"
p_nacionalidade <- "Nacionalidade\\:\\s*(.+)?\r\n"
p_vulgos <- "Vulgos\\:\\s*(.+)?Outros Nomes"
p_unid_sigla <- "Unidade:\\s*(\\w+)"
p_unid <- "Unidade:\\s*\\w+\\s*-?\\s*(\\w.+?)\r\n"
p_situ <- "Situa\u00e7\u00e3o:\\s*(\\w+)"
p_n_exec <- "Processo:\\s*(\\d{7}-\\d{2}\\.\\d{4}\\.\\d\\.\\d{2}\\.\\d{4})"

tibble::tibble(
  "exec" = extract_var(tfd, p_n_exec),
  "nome" = extract_var(tfd, p_nome),
  "apelidos" = extract_var(tfd, p_vulgos),
  "data_nasc" = extract_var(tfd, p_data_nasc),
  "pai" = extract_var(tfd, p_pai),
  "mae" = extract_var(tfd, p_mae),
  "natur" = extract_var(tfd, p_naturalidade),
  "nacio" = extract_var(tfd, p_nacionalidade),
  "cor" = extract_var(tfd, p_cor),
  "educ" = extract_var(tfd, p_escolaridade),
  "prof" = extract_var(tfd, p_profissao),
  "est_civ" = extract_var(tfd, p_estado_civil),
  "pris" = extract_var(tfd, p_unid),
  "pris_abrv" = extract_var(tfd, p_unid_sigla),
  "pris_situ" = extract_var(tfd, p_situ)
) %>%
  dplyr::mutate(dplyr::across(dplyr::everything(),
                              .fns = function(x){str_trim(x) %>%
                                  str_squish()}))
}


get_socio <- function(file) {
  tfd <- get_tfd(file)
  tfd %>%
    organize_tfd() %>% collapse_tfd() %>%
    dplyr::last() %>%
    extract_socio() %>%
    dplyr::mutate(
      url = url,
      ref_mov = dplyr::last(get_ref_mov(tfd)),
      data_mov = get_tfd_date(tfd)
    )
}
