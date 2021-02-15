#' Print session and run info to console/log file
#'
#' @inheritParams default_params_doc
#'
#' @return Nothing. Prints session and run info to console.
#'
#' @examples
#' \dontrun{
#' print_main_header(
#'   datalist_name = "spider_scenario_1_1_1_datalist",
#'   M = 165,
#'   model = 1
#' )
#' }
#' @author Pedro Neves
print_main_header <- function(datalist_name, M, model) {
  print(devtools::session_info())
  message(Sys.time())

  message("Datalist: ", datalist_name)
  message("M: ", M)
  message("model: ", model)
}
