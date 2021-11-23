## code to prepare `a_m_min` dataset goes here

data("a_m_min_datatable")

a_m_min <- DAISIE::DAISIE_dataprep(
  a_m_min_datatable,
  island_age = 3.6,
  M = 168
)

usethis::use_data(a_m_min, overwrite = TRUE)
