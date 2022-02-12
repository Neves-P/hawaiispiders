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
  plot_with_legend <- plot_estimate_results(
    plotting_table = plotting_table,
    x_partition_by = x_partition_by,
    parameter_name = parameter_names[1],
    colour_by = colour_by,
    shape_by = shape_by
  )
  for (i in seq_along(parameter_names)) {
    estimate_plots[[i]] <- plot_estimate_results(
      plotting_table = plotting_table,
      x_partition_by = x_partition_by,
      parameter_name = parameter_names[i],
      colour_by = colour_by,
      shape_by = shape_by
    ) + ggplot2::theme(legend.position = "none")
  }
  legend <- cowplot::get_legend(plot_with_legend)

  no_legend_grid <- cowplot::plot_grid(
    plotlist = estimate_plots,
    ncol = 2,
    align = "h"
  )

  grid_with_legend <- cowplot::plot_grid(
    no_legend_grid,
    legend,
    rel_widths = c(3.5, 1)
  )
  grid_with_legend
}
