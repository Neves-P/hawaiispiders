#' List all spider scenarios
#'
#' @return Character vector, with all spider scenarios in the study, such as
#'   `"y_c_max"`.
#' @export
#'
#' @author Pedro Santos Neves
#' @examples
#' scenarios <- spider_scenarios()
spider_scenarios <- function() {
  scenarios <- c(
    "y_c_max",
    "y_m_max",
    "y_c_min",
    "y_m_min",
    "y_c_no",
    "y_m_no",
    "o_c_max",
    "o_m_max",
    "o_c_min",
    "o_m_min",
    "o_c_no",
    "o_m_no"
  )
  return(scenarios)
}
