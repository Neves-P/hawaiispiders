data("m_master")

# Split by species (upper case)

species_names <-gsub('([[:upper:]])', ' \\1', m_master$Clade_name)
genus_names <- sapply(strsplit(species_names, "_"), `[[`, 1)
brts_avail <- ifelse(!is.na(m_master$Branching_times), "Available", NA)
minage_avail <- ifelse(!is.na(m_master$MinAge), "Available", NA)

species_genus_table <- data.frame(
  genus_names = genus_names,
  species_names = species_names,
  brts_avail = brts_avail,
  minage_avail = minage_avail
)

write.csv(species_genus_table, "species_genus_table.csv")

