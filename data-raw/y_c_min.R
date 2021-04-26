## code to prepare `y_c_min` dataset goes here

data("y_c_min_datatable")

y_c_min <- DAISIE::DAISIE_dataprep(
  y_c_min_datatable,
  island_age = 1.2,
  M = 165
)

usethis::use_data(y_c_min, overwrite = TRUE)
