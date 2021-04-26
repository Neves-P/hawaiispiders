## code to prepare `y_m_max` dataset goes here

data("y_m_max_datatable")

y_m_max <- DAISIE::DAISIE_dataprep(
  y_m_max_datatable,
  island_age = 1.2,
  M = 165
)

usethis::use_data(y_m_max, overwrite = TRUE)
