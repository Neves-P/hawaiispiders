data("m_master")

# Split by species (upper case)

species_names <- paste0("\textit{", gsub('_', ' \\1', m_master$Clade_name), "}")
brts_avail <- ifelse(!is.na(m_master$Branching_times), "Available", NA)
minage_avail <- ifelse(!is.na(m_master$MinAge), "Available", NA)
status <- ifelse(m_master$Status == "Endemic", "Endemic", NA)

species_genus_table <- data.frame(
  species_names = species_names,
  brts_avail = brts_avail,
  minage_avail = minage_avail
)

write.csv(species_genus_table, "species_genus_table.csv")
xtable::xtable(species_genus_table)
