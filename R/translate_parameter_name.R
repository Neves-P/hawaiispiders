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
    "lambda_c" = "\u03BB\u1D9C",
    "lambda_a" = "\u03BB\U1D43",
    "gamma" = "\u03B3",
    "mu" = "\u03BC",
    "K" = "K"
  )

  out
}
