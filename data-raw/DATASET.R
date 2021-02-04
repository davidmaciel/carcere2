## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(furrr)
set.seed(13)
devtools::load_all()
execs <- execs
sample <- sample_n(execs, 14334, replace = F)

get_size <- possibly(get_size, "erro")

plan(multisession, workers = 4)

system.time(
sample <- sample %>%
  mutate(file_size = future_map_chr(url, get_size))
)
