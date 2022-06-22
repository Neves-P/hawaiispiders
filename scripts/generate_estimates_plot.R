library(hawaiispiders)
# Load data
data(res)

res <-



old_version <- dplyr::filter(res, version == "4.1.0")
new_version <- dplyr::filter(res, version == "4.2.1")

diffs <- new_version[2:6] - old_version[2:6]
plot(diffs$lambda_c)
plot(diffs$mu)
plot(diffs$K)
plot(diffs$gamma)
plot(diffs$lambda_a)


data_to_plot <- prepare_results_to_plot(new_version)
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
  file_name = "facet_all_data",
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
  file_name = "facet_no_outlier",
  type_size = "full_size"
)

