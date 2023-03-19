#' Translate partitioning codes into plottable English
#'
#' @inheritParams default_params_doc
#'
#' @return A character string with formatted name of partition
#' @export
#'
#' @examples
#' plottable_name <- translate_partition_name(partition_name = "island_age")
translate_partition_name <- function(partition_name) {
  out <- switch(partition_name,
                 "island_age" = "Assumed island age (Ma)",
                 "c_m" = "Uncertainty in\nnumber of\ncolonisations",
                 "stac" = "Uncertainty in\ncolonisation time",
  )
  out
}
