#' Title
#'
#' @inheritParams default_params_doc
#'
#' @return A plot of one estimate partitioned by a given factor
#' @export
#'
#' @examples
plot_estimate_results <- function(plotting_table,
                                  parameter_name,
                                  x_partition_by,
                                  colour_by,
                                  shape_by) {

  estimate_label <- translate_parameter_name(parameter_name = parameter_name)
  partition_label <- translate_partition_name(partition_name = x_partition_by)
  colour_label <- translate_partition_name(partition_name = colour_by)
  shape_label <- translate_partition_name(partition_name = shape_by)

  ggplot2::ggplot(data = plotting_table) +
    ggplot2::geom_point(position = ggplot2::position_dodge(0.15)) +
    ggplot2::aes(x = get(x_partition_by),
                 y = get(parameter_name),
                 colour = get(colour_by),
                 shape = get(shape_by)) +
    ggplot2::theme_classic() +
    ggplot2::scale_color_brewer(type = "qual", palette = "Set1") +
    ggplot2::guides(colour = ggplot2::guide_legend(colour_label),
                    shape = ggplot2::guide_legend(shape_label)) +
    ggplot2::ylab(label = estimate_label) +
    ggplot2::xlab(label = partition_label)
}
