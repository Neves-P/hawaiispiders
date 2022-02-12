#' Title
#'
#' @inheritParams default_params_doc
#'
#' @return
#' @export
#'
#' @examples
translate_partition_name <- function(partition_name) {
  out <- switch (partition_name,
                 "island_age" = "Island age",
                 "c_m" = "Grouping or\nSplitting",
                 "stac" = "Treatment of\nuncertainty",
  )
  out
}
