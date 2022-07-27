

datatables <- rbind(
  # cbind(a_c_max_datatable, age = factor("a"), stac = factor("max")),
  # cbind(a_c_min_datatable, age = factor("a"), stac = factor("min")),
  cbind(a_c_no_datatable,  age = factor("a"), stac = factor("no")),
  # cbind(o_c_max_datatable,  age = factor("o"), stac = factor("max")),
  # cbind(o_c_min_datatable,  age = factor("o"), stac = factor("min")),
  cbind(o_c_no_datatable,  age = factor("o"), stac = factor("no")),
  # cbind(y_c_max_datatable,  age = factor("y"), stac = factor("max")),
  # cbind(y_c_min_datatable,  age = factor("y"), stac = factor("min")),
  cbind(y_c_no_datatable,  age = factor("y"), stac = factor("no")),
  # cbind(r_c_max_datatable,  age = factor("r"), stac = factor("max")),
  # cbind(r_c_min_datatable,  age = factor("r"), stac = factor("min")),
  cbind(r_c_no_datatable,  age = factor("r"), stac = factor("no"))
)

brts <- strsplit(datatables$Branching_times, ",")
first_brt <- as.numeric(sapply(brts, "[", 1))
second_brt <- as.numeric(sapply(brts, "[", 2))
datatables <- cbind(datatables, first_brt, second_brt)
datatables$first_brt[which(is.na(datatables$first_brt) &
                             datatables$age == factor("a", levels = c("a", "o", "y", "r")))] <-
  4.8
datatables$first_brt[which(is.na(datatables$first_brt) &
                             datatables$age == factor("o", levels = c("a", "o", "y", "r")))] <-
  3.6
datatables$first_brt[which(is.na(datatables$first_brt) &
                             datatables$age == factor("y", levels = c("a", "o", "y", "r")))] <-
  2.4
datatables$first_brt[which(is.na(datatables$first_brt) &
                             datatables$age == factor("r", levels = c("a", "o", "y", "r")))] <-
  1.2
datatables <- dplyr::group_by(datatables, Clade_name)
datatables <- dplyr::arrange(datatables, dplyr::desc(first_brt), .by_group = TRUE)
datatables <- cbind(datatables, id = 1:nrow(datatables))

library(ggplot2)

# Plot
# Colour lines
data_plot_1 <- ggplot(datatables, aes(x = id, y = first_brt)) +
  geom_segment(aes(
    x = id,
    xend = id,
    y = 0,
    yend = first_brt
  )) +
  geom_point(size = 3, aes(colour = Status)) +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), legend.position = "none") +
  ylab("Time (myr)")


data_plot_2 <- ggplot(datatables, aes(y = id, x = first_brt)) +
  geom_segment(aes(
    y = id,
    yend = id,
    x = 0,
    xend = first_brt
  )) +
  geom_point(size = 3, aes(colour = Status)) +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), legend.position = "none") +
  ylab("Time (myr)")

# estimates

# Plot instead lambda_c1
# Load data
data(res)
res <- dplyr::filter(res, version == "4.2.1")

data_to_plot <- prepare_results_to_plot(res)
pivot_to_plot <- data_to_plot[, -(7:10)] |>
  tidyr::pivot_longer(-scenario &
                        -version & -island_age & -c_m & -stac)

r_pivot_to_plot <- pivot_to_plot |> dplyr::filter(island_age == 1.2)
y_pivot_to_plot <- pivot_to_plot |> dplyr::filter(island_age == 2.4)
o_pivot_to_plot <- pivot_to_plot |> dplyr::filter(island_age == 3.6)
a_pivot_to_plot <- pivot_to_plot |> dplyr::filter(island_age == 4.8)

r_plot <- ggplot2::ggplot(data = r_pivot_to_plot) +
  ggplot2::geom_point(position = ggplot2::position_dodge(0.5),
                      ggplot2::aes(x = name,
                                   y = value,
                                   shape = stac)) +
  ggplot2::xlab("Parameters") +
  ggplot2::theme(legend.position = "none",
                 axis.title.y = ggplot2::element_blank()) +
  ggplot2::scale_x_discrete(
    labels = c("lambda_c" = "\u03BB\u1D9C",
               "lambda_a" = "\u03BB\U1D43",
               "gamma" = "\u03B3",
               "mu" = "\u03BC",
               "K" = "K")
  )
y_plot <- ggplot2::ggplot(data = y_pivot_to_plot) +
  ggplot2::geom_point(position = ggplot2::position_dodge(0.5),
                      ggplot2::aes(x = name,
                                   y = value,
                                   shape = stac)) +
  ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                 axis.text.x = ggplot2::element_blank(),
                 legend.position = "none",
                 axis.title.y = ggplot2::element_blank())
o_plot <- ggplot2::ggplot(data = o_pivot_to_plot) +
  ggplot2::geom_point(position = ggplot2::position_dodge(0.5),
                      ggplot2::aes(x = name,
                                   y = value,
                                   shape = stac)) +
  ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                 axis.text.x = ggplot2::element_blank(),
                 legend.position = "none",
                 axis.title.y = ggplot2::element_blank())
a_plot <- ggplot2::ggplot(data = a_pivot_to_plot) +
  ggplot2::geom_point(position = ggplot2::position_dodge(0.5),
                      ggplot2::aes(x = name,
                                   y = value,
                                   shape = stac)) +
  ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                 axis.text.x = ggplot2::element_blank(),
                 legend.position = "none",
                 axis.title.y = ggplot2::element_blank())
library(patchwork)

facet_plot_1 <- (data_plot_1 | (a_plot / o_plot / y_plot / r_plot)) + plot_layout(widths = c(2, 1))
facet_plot_2 <- (data_plot_2 / (a_plot | o_plot | y_plot | r_plot)) + plot_layout(heights = c(2, 1))
ggplot2::ggsave(
  plot = facet_plot_1,
  filename = paste0("facet_plot_1.png"),
  device = "png",
  width = 168,
  height = 200,
  units = "mm"
)

ggplot2::ggsave(
  plot = facet_plot_2,
  filename = paste0("facet_plot_2.png"),
  device = "png",
  width = 168,
  height = 200,
  units = "mm"
)

