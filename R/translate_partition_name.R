#' Translate partitioning codes into plottable English
#'
#' @inheritParams default_params_doc
#'
#' @return
#' @export
#'
#' @examples
translate_partition_name <- function(partition_name) {
  out <- switch (partition_name,
                 "island_age" = "Island age (myr)",
                 "c_m" = "Grouping\napproach",
                 "stac" = "Treatment of\nuncertainty",
  )
  out
}
