## code to prepare `y_c_no` dataset goes here

data("y_c_no_datatable")

y_c_no <- DAISIE::DAISIE_dataprep(
  y_c_no_datatable,
  island_age = 1.2,
  M = 165
)

usethis::use_data(y_c_no, overwrite = TRUE)
