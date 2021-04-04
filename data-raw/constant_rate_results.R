## code to prepare `constant_rate_results` dataset goes here

constant_rate_results <- DAISIEutils::load_txt_results(
  system.file("extdata", "results", package = "hawaiispiders")
)

usethis::use_data(constant_rate_results, overwrite = TRUE)
