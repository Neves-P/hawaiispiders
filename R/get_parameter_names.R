#' DAISIE parameter names
#'
#' @return A character vector with 5 elements, each being the name of a DAISIE
#'   model parameter.
#' @export
#' @author Pedro Santos Neves
#'
#' @examples
#' parameter_names <- get_parameter_names()
get_parameter_names <- function() {
  c("lambda_c", "mu", "K", "gamma", "lambda_a")
}
