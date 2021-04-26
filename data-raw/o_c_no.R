## code to prepare `o_c_no` dataset goes here

data("o_c_no_datatable")

o_c_no <- DAISIE::DAISIE_dataprep(
  o_c_no_datatable,
  island_age = 2.4,
  M = 165
)

usethis::use_data(o_c_no, overwrite = TRUE)
