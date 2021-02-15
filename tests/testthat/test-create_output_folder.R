test_that("Directory is created", {

  file_name <- create_output_folder(output_name = "results", model = 1)
  expect_equal(file_name, "spiders/results/results_m_1.txt")
  expect_true(dir.exists("spiders/results"))
  # Clean-up
  expect_equal(unlink("spiders", recursive = TRUE), 0)
})
