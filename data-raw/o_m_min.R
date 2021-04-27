## code to prepare `o_m_min` dataset goes here

data("o_m_min_datatable")

o_m_min <- DAISIE::DAISIE_dataprep(
  o_m_min_datatable,
  island_age = 2.4,
  M = 165
)

usethis::use_data(o_m_min, overwrite = TRUE)
