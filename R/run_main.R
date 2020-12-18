#' Run analysis from a set of initial parameters
#'
#' @inheritParams default_params_doc
#'
#' @return Saves results to .txt file.
#' @export
#'
#' @examples
#' # Run 20 sets of randomly sampled initial parameters for scenario 1 and
#' # model 1
#' \dontrun{
#' run_main(
#'   datalist_name = "spider_scenario_1_datalist",
#'   M = 165,
#'   model = 1,
#'   seed_range = c(1,20)
#' )
#' }
#' @author Pedro Neves
run_main <- function(datalist_name, M = 165, model, seed_range) {

  print(utils::sessionInfo())
  message(Sys.time())


  testit::assert(is.character(datalist_name))
  message("Datalist: ", datalist_name)
  message("M: ", M)
  message("model: ", model)

  testit::assert(length(seed_range) == 1 || length(seed_range) == 2)
  if (length(seed_range) != 2) {
    seed_range <- c(seed_range[1], seed_range[1])
  }


  cluster_folder <- file.path("spiders", datalist_name)
  if (!dir.exists(cluster_folder)) {
    dir.create(path = cluster_folder, recursive = TRUE)
  }
  file_path <- file.path(
    cluster_folder,
    paste0(datalist_name, "_", "m_", model, ".txt")
  )

  output_file_header <- c(
    "datalist_name",
    "model",
    "seed",
    "island_age",
    "M",
    "type",
    "P_type2",
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
