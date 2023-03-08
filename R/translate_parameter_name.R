#' Translate parameter name into plain English
#'
#' @inheritParams default_params_doc
#'
#' @return A character with the corresponding well formatted parameter name
#' @export
#'
#' @examples
#' parameter_name <- translate_parameter_name("lambda_c")
translate_parameter_name <- function(parameter_name) {
  out <- switch(
    parameter_name,
    "lambda_c" = "Cladogenesis rate",
    "lambda_a" = "Anagenesis rate",
    "gamma" = "Colonisation rate",
    "mu" = "Extinction rate",
    "K" = "Carrying capacity"
  )

  out
}
