## code to prepare `o_c_max` dataset goes here

data("o_c_max_datatable")

o_c_max <- DAISIE::DAISIE_dataprep(
  o_c_max_datatable,
  island_age = 2.4,
  M = 165
)

usethis::use_data(o_c_max, overwrite = TRUE)
