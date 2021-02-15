#' Run analysis from a set of initial parameters
#'
#' @inheritParams default_params_doc
#'
#' @return Saves results to .txt file.
#' @export
#'
#' @examples
#' # Run 1 set of randomly sampled initial parameters for scenario 1 and
#' # model 1
#' \dontrun{
#' run_main(
#'   datalist_name = "spider_scenario_1_1_1_datalist",
#'   M = 165,
#'   model = 1,
#'   seed_range = 1
#' )
#' }
#' @author Pedro Neves
run_main <- function(datalist_name,
                     M = 165,
                     model,
                     seed_range,
                     verbose = FALSE) {

  testit::assert(is.character(datalist_name))

  if (verbose) {
    print_main_header(datalist_name = datalist_name, M = M, model = model)
  }

  testit::assert(length(seed_range) == 1 || length(seed_range) == 2)
  if (length(seed_range) != 2) {
    seed_range <- c(seed_range[1], seed_range[1])
  }

  file_path <- create_output_folder(output_name = datalist_name, model = model)

  output_file_header <- c(
    "datalist_name",
    "model",
    "seed",
    "island_age",
    "M",
    "type",
    "p_type2",
    "res",
    "methode",
    "run_number",
    "results",
    "initparsopt"
  )

  write(
    output_file_header,
    file = file_path,
    ncolumns = length(output_file_header),
    append = TRUE,
    sep = "\t"
  )

  for (seed in seed_range[1]:seed_range[2]) {
    message("Running analysis with seed ", seed, " of ", seed_range[2])
    run_spider_analysis(
      datalist_name = datalist_name,
      M = M,
      model = model,
      seed = seed,
      file_path = file_path
    )
  }
}
