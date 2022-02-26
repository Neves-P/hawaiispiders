#' Title
#'
#' @inheritParams default_params_doc
#'
#' @return
#' @export
#'
#' @examples
translate_parameter_name <- function(parameter_name) {
  out <- switch (parameter_name,
    "lambda_c" = "Cladogenesis rate",
    "mu" = "Extinction rate",
    "K" = "Carrying capacity",
    "gamma" = "Colonisation rate",
    "lambda_a" = "Anagenesis rate"
  )
  out
}
