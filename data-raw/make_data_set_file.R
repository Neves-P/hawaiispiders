## code to prepare `daisie_objects` goes here

data("c_master")
data("m_master")
library(usethis)

dataset_list <- list(c_master, m_master)

island_ages <- 1.2 * 1:4
age_names <- c("r", "y", "o", "a")
c_or_m <- c("c", "m")


dataset_out <- list()
dataset_ages <- list()
stac_handlings <- c("max", "min", "no")
name <- c()
for (h in seq_along(stac_handlings)) {
  for (i in seq_along(island_ages)) {
    dataset_c_m <- list()
    for (j in seq_along(dataset_list)) {
      dataset_template <- data.frame(
        "Clade_name" = character(),
        "Status" = character(),
        "Missing_species" = numeric(),
        "Branching_times" = numeric()
      )

      for (k in seq_len(nrow(dataset_list[[j]]))) {
        dataset_template[k, "Clade_name"] <- dataset_list[[j]][k, "Clade_name"]
        dataset_template[k, "Missing_species"] <- dataset_list[[j]][k, "Missing_species"]
        dataset_template[k, "Branching_times"] <- dataset_list[[j]][k, "Branching_times"]
        ages <- dataset_list[[j]][k, "Branching_times"]
        brts <- sort(
          as.numeric(unlist(strsplit(
            as.character(ages),
            split = ","))),
          decreasing = TRUE,
          na.last = TRUE
        )
        status_suffix <- ""
        duplicate_word_index <- anyDuplicated(strsplit(
          as.character(dataset_template[k, "Clade_name"]),
          split = "_"
        )[[1]])
        if ((brts[1] >= island_ages[i] || is.na(brts)) || stac_handlings[h] == "max") {
          status_suffix <- "_MaxAge"
          # Returns 0 if there are no dup words or num if there are dup words
        }
        if (length(brts) > 1 && duplicate_word_index >= 0) {

            status_suffix <- "_MaxAgeMinAge"
            if (brts[2] > island_ages[i]) {
              dataset_template[k, "Missing_species"] <- dataset_template[k, "Missing_species"] + 1
              dataset_template[k, "Branching_times"] <- paste(as.character(brts)[-2], sep = "", collapse = ",")
            }
          }

        # MinAge favour (MaxAgeMinAge even when precise col is known)
        if (length(brts) > 1 && duplicate_word_index == 0 && stac_handlings[h] == "min") {
          status_suffix <- "_MaxAgeMinAge"
        }
        dataset_template[k, "Status"] <- paste0(
          dataset_list[[j]][k, "Status"],
          status_suffix
        )
      }
      dataset_c_m[[j]] <- dataset_template
      name_datatable <- paste(
        age_names[i],
        c_or_m[j],
        stac_handlings[h],
        "datatable",
        sep = "_"
      )
      name <- paste(
        age_names[i],
        c_or_m[j],
        stac_handlings[h],
        sep = "_"
      )
      assign(name_datatable, value = dataset_template)
      saveRDS(get(name_datatable), file = file.path("data", paste0(name_datatable, ".rds")))
      browser
      assign(name, value = DAISIE::DAISIE_dataprep(
        datatable = dataset_template,
        island_age = island_ages[i],
        M = 168
      ))
      do.call("use_data", list(as.name(name), overwrite = TRUE))
      do.call("use_data", list(as.name(name_datatable), overwrite = TRUE))
      # saveRDS(get(name), file = file.path("data", paste0(name, ".rds")))
    }
    dataset_ages[[i]] <- dataset_c_m
  }
  dataset_out[[h]] <- dataset_ages
}
