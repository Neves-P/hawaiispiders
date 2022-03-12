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
                                  partition_by,
                                  colour_by,
                                  shape_by) {

  testit::assert(
    identical(length(parameter_name), 1) &&
      identical(length(partition_by), 1) &&
      identical(length(colour_by), 1) &&
      identical(length(shape_by), 1)
    )
  estimate_label <- translate_parameter_name(parameter_name = parameter_name)
  partition_label <- translate_partition_name(partition_name = partition_by)
  colour_label <- translate_partition_name(partition_name = colour_by)
  shape_label <- translate_partition_name(partition_name = shape_by)

  ggplot2::ggplot(data = plotting_table) +
    ggplot2::geom_point(position = ggplot2::position_dodge(0.5),
                        ggplot2::aes(x = get(partition_by),
                                     y = get(parameter_name),
                                     group = get(shape_by),
                                     shape = get(shape_by),
                                     colour = get(colour_by))) +
    ggplot2::theme_classic() +
    ggplot2::scale_color_brewer(type = "qual", palette = "Set1") +
    ggplot2::guides(colour = ggplot2::guide_legend(colour_label),
                    shape = ggplot2::guide_legend(shape_label)) +
    ggplot2::ylab(label = estimate_label) +
    ggplot2::xlab(label = partition_label) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 9)) +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 8)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 9)) +
    ggplot2::coord_cartesian(ylim = c(0, NA))
}
