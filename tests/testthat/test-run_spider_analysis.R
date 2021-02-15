test_that("multiplication works", {
  datalist_name <- "spider_scenario_1_1_1_datalist"
  M <- 165
  model <- 1
  seed <- 1

  file_path <- create_output_folder(output_name = datalist_name, model = model)

  out <- run_spider_analysis(
      datalist_name = datalist_name,
      M = M,
      model = model,
      seed = seed,
      file_path = file_path
  )
  # Clean-up
  expect_equal(unlink("spiders", recursive = TRUE), 0)

})
