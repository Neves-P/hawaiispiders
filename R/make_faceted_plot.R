#' Title
#'
#' @inheritParams default_params_doc
#'
#' @return
#' @export
#'
#' @examples
make_faceted_plot <- function(plotting_table,
                              parameter_names = get_parameter_names(),
                              x_partition_by,
                              colour_by,
                              shape_by) {
  testit::assert(all(parameter_names %in% get_parameter_names()))
  estimate_plots <- list()
  for (i in seq_along(parameter_names)) {
    estimate_plots[[i]] <- plot_estimate_results(
      plotting_table = plotting_table,
      x_partition_by = x_partition_by,
      parameter_name = parameter_names[i],
      colour_by = colour_by,
      shape_by = shape_by
    )
  }
  # Default legend settings
  legend_direction <- "vertical"
  legend_position <- "right"
  # If number of plots is odd, add legend on free space
  if (!identical(length(estimate_plots) %% 2, 0)) {
    estimate_plots[[length(estimate_plots) + 1]] <- patchwork::guide_area()
    legend_direction <- "vertical"
    legend_position <- "bottom"
  }
  grid_with_legend <- patchwork::wrap_plots(
    estimate_plots,
    ncol = 2,
    guides = "collect") & ggplot2::theme(
      legend.direction = legend_direction,
      legend.position = legend_position,
      legend.key.height = ggplot2::unit(0.4, "cm")
    )
  grid_with_legend
}
