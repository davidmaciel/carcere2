
sample_url <- function(size){
  if(!"execs" %in% ls(envir = globalenv())){
  load("R/sysdata.rda", envir = globalenv())
  }
  sample(execs$url,size)
}

get_size <- function(url){
 httr::GET(url)$headers$`content-length`
}


has_pdf <- function(url) {
  pdftools::pdf_text(url) %>% is.character()
}


has_tfd <- function(url) {
  tfd <- get_tfd(url)

  if(is.null(tfd)){
    FALSE
  } else {
    TRUE
  }
}

has_educ <- function(url){
  tfd <- get_tfd(url)
  if(is.null(tfd)){
    FALSE
  } else {
    stringr::str_detect(tfd, "Educacionais")
  }

}


has_falta <- function(url){
  tfd <- get_tfd(url)
  if(is.null(tfd)){
    FALSE
  } else {
    stringr::str_detect(tfd, "Disciplinares")
  }

}

has_regalia <- function(url){
  tfd <- get_tfd(url)
  if(is.null(tfd)){
    FALSE
  } else {
    stringr::str_detect(tfd, "Regalias")
  }

}


has_trabalho <- function(url){
  tfd <- get_tfd(url)
  if(is.null(tfd)){
    FALSE
  } else {
    stringr::str_detect(tfd, "[lL]aborativas?")
  }

}


