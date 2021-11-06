## code to prepare `o_m_max` dataset goes here

data("o_m_max_datatable")

o_m_max <- DAISIE::DAISIE_dataprep(
  o_m_max_datatable,
  island_age = 2.4,
  M = 168
)

usethis::use_data(o_m_max, overwrite = TRUE)
