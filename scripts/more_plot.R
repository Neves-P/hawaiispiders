library(hawaiispiders)
# Load data
data(res)
res <- dplyr::filter(res, version == "4.2.1")

data_to_plot <- prepare_results_to_plot(res)
pivot_to_plot <- data_to_plot[, -(7:10)] |>
  tidyr::pivot_longer(-scenario & -version & -island_age & -c_m & -stac)

ggplot2::ggplot(data = pivot_to_plot) +
  ggplot2::geom_point(position = ggplot2::position_dodge(0.5),
                      ggplot2::aes(x = name,
                                   y = value,
                                   colour = stac))
