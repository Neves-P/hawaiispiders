datatables <- rbind(
  cbind(a_c_no_datatable,  age = factor("a"), stac = factor("no")),
  cbind(o_c_no_datatable,  age = factor("o"), stac = factor("no")),
  cbind(y_c_no_datatable,  age = factor("y"), stac = factor("no")),
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
datatables$first_brt[
  which(is.na(datatables$first_brt) &
          datatables$age == factor("r", levels = c("a", "o", "y", "r"))
  )] <- 1.2


datatables$first_brt[
  which(datatables$first_brt > 4.8 &
          datatables$age == factor("a", levels = c("a", "o", "y", "r")))] <- 4.8

datatables$first_brt[
  which(datatables$first_brt > 3.6 &
          datatables$age == factor("o", levels = c("a", "o", "y", "r")))] <- 3.6

datatables$first_brt[
  which(datatables$first_brt > 2.4 &
          datatables$age == factor("y", levels = c("a", "o", "y", "r")))] <- 2.4
datatables$first_brt[
  which(datatables$first_brt > 1.2 &
          datatables$age == factor("r", levels = c("a", "o", "y", "r")))] <- 1.2

datatables <- dplyr::group_by(datatables, Clade_name)
datatables <- dplyr::arrange(datatables, dplyr::desc(first_brt), .by_group = TRUE)

library(ggplot2)

datatables$Status <- forcats::fct_recode(
  datatables$Status,
  EndemicPrecise = "Endemic",
  NonEndemicPrecise = "Non_Endemic",
  EndemicUpperBound = "Endemic_MaxAge",
  EndemicUpperLowerBound = "Endemic_MaxAgeMinAge",
  NonEndemicUpperBound = "Non_Endemic_MaxAge",
  NonEndemicUpperLowerBound = "Non_Endemic_MaxAgeMinAge"
)
datatables$Status <- forcats::fct_relevel(
  datatables$Status,
  c(
    "EndemicPrecise",
    "EndemicUpperBound",
    "NonEndemicPrecise",
    "NonEndemicUpperBound",
    "EndemicUpperLowerBound",
    "NonEndemicUpperLowerBound"
  )
)

data_plot <- ggplot(datatables, aes(y = Clade_name, x = first_brt)) +
  geom_segment(aes(
    y = Clade_name,
    yend = Clade_name,
    x = first_brt,
    xend = 0
  )) +
  geom_point(size = 3, aes(colour = Status)) +
  theme_classic() +
  theme(
    axis.text.y = element_blank(),
    axis.title.y = element_blank(),
    axis.ticks.y = element_blank(),
    legend.position = "bottom",
    legend.title = element_blank()
  ) +
  scale_color_brewer(
    palette = "Dark2",
    labels = c(
      "Endemic precise",
      "Endemic upper bound",
      "Non-endemic precise",
      "Non-endemic upper bound",
      "Endemic upper and lower bound",
      "Non-endemic upper and lower bound"
    )) +
  xlab("Time (myr)") +
  geom_vline(xintercept = 1.2, linetype = "dashed", size = 0.4) +
  geom_vline(xintercept = 2.4, linetype = "dashed", size = 0.4) +
  geom_vline(xintercept = 3.6, linetype = "dashed", size = 0.4) +
  geom_vline(xintercept = 4.8, linetype = "dashed", size = 0.4)


# estimatesdata(res)
res <- dplyr::filter(res, version == "4.2.1")

save_paper_plot(
  plot_to_save = data_plot,
  file_name = "data_plot",
  type_size = "full_size"
)
