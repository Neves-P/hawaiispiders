
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
# datatables$first_brt[which(is.na(datatables$first_brt) & datatables$age == factor("a", levels = c("a", "o", "y", "r")))] <- 4.8
# datatables$first_brt[which(is.na(datatables$first_brt) & datatables$age == factor("o", levels = c("a", "o", "y", "r")))] <- 3.6
# datatables$first_brt[which(is.na(datatables$first_brt) & datatables$age == factor("y", levels = c("a", "o", "y", "r")))] <- 2.4
# datatables$first_brt[which(is.na(datatables$first_brt) & datatables$age == factor("r", levels = c("a", "o", "y", "r")))] <- 1.2
datatables <- dplyr::group_by(datatables, Clade_name)
datatables <- dplyr::arrange(datatables, dplyr::desc(first_brt), .by_group = TRUE)
datatables <- cbind(datatables, id = 1:nrow(datatables))

library(ggplot2)

# Plot
ggplot(datatables, aes(x = id, y = first_brt)) +
  geom_segment(aes(
    x = id,
    xend = id,
    y = 0,
    yend = first_brt
  )) +
  geom_point(size = 3, aes(colour = Status)) +
  theme(axis.text.x = element_blank())



