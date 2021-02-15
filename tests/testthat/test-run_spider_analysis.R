test_that("multiplication works", {
  testthat::local_edition(x = 3)
  datalist_name <- "spider_scenario_1_1_1_datalist"
  M <- 165
  model <- 1
  seed <- 1

  system.file("extdata", "spider_scenario_1_1_1.csv",
              package = "hawaiispiders")
  cluster_folder <- system.file("data", paste0(datalist_name, ".rda"),
                                package = "hawaiispiders")
  file_path <- file.path(
    cluster_folder,
    paste0(datalist_name, "_", "m_", model, ".txt")
  )

  expect_snapshot_value(x =
    run_spider_analysis(
      datalist_name = datalist_name,
      M = M,
      model = model,
      seed = seed,
      file_path = file_path
    ),
    style = "json"
  )
})
