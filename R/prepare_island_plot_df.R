#' Title
#'
#' @param island
#'
#' @return
#' @export
#'
#' @examples
prepare_island_plot_df <- function(island) {
  # First gather data in vectors
  island_clades <- island[2:length(island)]
  branching_times_list <- lapply(island_clades, FUN = `[[`, "branching_times")
  # Remove island age element
  branching_times_list <- lapply(
    branching_times_list,
    FUN = function(x) x[-1]
  )
  branching_times_list <- lapply(
    branching_times_list,
    FUN = function(x) c(x, 0)
  )
  clade_names_list <- lapply(island_clades, FUN = `[[`, "colonist_name")
  stacs_list <- lapply(island_clades, FUN = `[[`, "stac")
  missing_spec_list <- lapply(island_clades, FUN = `[[`, "missing_species")

  # Buffer columns as needed by clade length. The goal is to have a long
  # "tidy" data frame
  clade_names_vec <- c()
  stacs_vec <- c()
  missing_spec_vec <- c()
  for (i in seq_along(island_clades)) {
    length_vec <- length(branching_times_list[[i]])
    clade_names_vec <- c(
      clade_names_vec,
      rep(clade_names_list[[i]], length_vec)
    )
    stacs_vec <- c(stacs_vec, rep(stacs_list[[i]], length_vec))
    missing_spec_vec <- c(
      missing_spec_vec,
      rep(missing_spec_list[[i]], length_vec)
    )
  }
  branching_times_vec <- unlist(branching_times_list, use.names = FALSE)
  testit::assert(
    identical(length(clade_names_vec), length(stacs_vec)) &&
      identical(length(clade_names_vec), length(missing_spec_vec)) &&
      identical(length(clade_names_vec), length(branching_times_vec))
  )

  data_to_plot <- data.frame(
    "Clade" = factor(clade_names_vec),
    "Branching_times" = branching_times_vec,
    "stac" = factor(stacs_vec),
    "Missing_species" = missing_spec_vec
  )
  data_to_plot <- data_to_plot |>
    dplyr::select(Clade, Branching_times, stac) |>
    dplyr::mutate(
      point_style = dplyr::if_else(
        Branching_times == 0.0,
        factor("none", levels = c("none", "empty", "filled")),
        dplyr::if_else(
          stac %in% c(1, 5:9),
          factor("empty", levels = c("none", "empty", "filled")),
          factor("filled", levels = c("none", "empty", "filled"))
        )
      )
    )
  data_to_plot
}
