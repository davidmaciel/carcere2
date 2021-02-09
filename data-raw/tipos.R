devtools::load_all()
con <- conectar()
library(DBI)
library(usethis)



#tipos de execucao penal
q <- "SELECT DISTINCT tipo, subtipo FROM execucao"
tipos_exec <- dbGetQuery(con, q)

#tipos únicos de eventos
q <- "SELECT DISTINCT tipo, comp FROM evento"
tipos_evento <- DBI::dbGetQuery(con, q)

#tipos únicos de beneficios concedidos
q <- "SELECT DISTINCT tipo FROM beneficio_concedido"
tipos_bene_con <- dbGetQuery(con, q)

#tipos de beneficios nao concedidos
q <- "SELECT DISTINCT tipo FROM beneficio_nao_concedido"
tipos_bene_n_con <- dbGetQuery(con, q)

#tipos de crime
q <- "SELECT DISTINCT lei, art, descr FROM condenacoes"
tipos_crime <- dbGetQuery(con, q)

use_data(tipos_exec)
use_data(tipos_evento)
use_data(tipos_bene_con)
use_data(tipos_bene_n_con)
use_data(tipos_crime)
