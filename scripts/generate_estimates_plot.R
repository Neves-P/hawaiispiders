library(hawaiispiders)
# Load data
full_res <- readRDS("full_res.rds")
full_res <- dplyr::filter(full_res, integrator == "odeint")

data_to_plot <- prepare_results_to_plot(full_res)
data_to_plot_no_outlier <- data_to_plot
data_to_plot_no_outlier[2:6][data_to_plot_no_outlier[2:6] > 50] <- NA

facet_all_data <- make_faceted_plot(
  data_to_plot,
  partition_by = "island_age",
  colour_by = "stac",
  shape_by = "c_m"
)
save_paper_plot(
  plot_to_save = facet_all_data,
  name = "facet_all_data",
  type_size = "full_size"
)
facet_no_outlier <- make_faceted_plot(
  data_to_plot_no_outlier,
  partition_by = "island_age",
  colour_by = "stac",
  shape_by = "c_m"
)
save_paper_plot(
  plot_to_save = facet_no_outlier,
  name = "facet_no_outlier",
  type_size = "full_size"
)

