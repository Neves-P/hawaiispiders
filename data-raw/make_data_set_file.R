## code to prepare `daisie_objects` goes here

# MUST HAVE ENDEMIC NON ENDEMIC INFO IN FILE!!
data("c_master")
data("m_master")

dataset_list <- list(c_master, m_master)

island_ages <- rep(1.2, 4) * c(1, 2, 3, 4)



for (island_age in island_ages) {
  for (i in seq_along(dataset_list)) {
    dataset_template <- data.frame(
      "Clade_name" = character(),
      "Status" = character(),
      "Missing_species" = numeric(),
      "Branching_times" = numeric()
    )
    for (j in seq_len(nrow(dataset_list[[i]]))) {
      dataset_template[j, "Clade_name"] <- dataset_list[[i]][j, "Clade_name"]
      dataset_template[j, "Missing_species"] <- dataset_list[[i]][j, "Missing_species"]
      dataset_template[j, "Branching_times"] <- dataset_list[[i]][j, "Branching_times"]
      ages <- dataset_list[[i]][j, "Branching_times"]
      brts <- sort(
        as.numeric(unlist(strsplit(
          as.character(ages),
          split = ","))),
        decreasing = TRUE
      )
      status_suffix <- ""
      print(i)
      print(j)
      print(brts)
      if (brts[1] >= island_age || is.na(brts)) {
        status_suffix <- "_MaxAge"
      }
      only_single_species <- !duplicated(strsplit(
        as.character(dataset_template[j, "Clade_name"]),
        split = "_"
      ))
      if (length(brts) > 1 && only_single_species) {
        paste0(status_suffix, "MinAge")
      }
      dataset_template[j, "Status"] <- paste0(
        dataset_list[[i]][j, "Status"],
        status_suffix
      )
    }


  }
}

usethis::use_data(m_master, overwrite = TRUE)

