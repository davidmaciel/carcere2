## code to prepare `DATASET` dataset goes here
url <- execs$url[sample(1:nrow(execs),1)]
tfd <- get_tfd(url)
 tfd %>%
  organize_tfd() %>% collapse_tfd() %>%
  dplyr::last() %>%
  extract_socio() %>%
  dplyr::mutate(url = url,
                ref_mov = last(get_ref_mov(tfd)),
                data_mov = get_tfd_date(tfd))


x <- get_tfd(url) %>%
  organize_tfd() %>% collapse_tfd() %>%
  dplyr::last()
cat(x)
