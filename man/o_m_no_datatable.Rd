% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{o_m_no_datatable}
\alias{o_m_no_datatable}
\title{DAISIE datatable of spiders on Hawaii (Big Island) - o_m_no}
\format{
A data frame with 52 rows and 5 variables:
\describe{
\item{Clade_name}{character vector with name of each lineage}
\item{Status}{character vector with endemicity status. Can be
\code{"Endemic_MaxAge"}, \code{"NonEndemic_MaxAge"}, \code{"Endemic_MaxAgeMinAge"} or
\code{"NonEndemic_MaxAgeMinAge"}}
\item{Missing_species}{numeric with the number of known species that are
missing in the phylogeny}
\item{Branching_times}{ordered numeric vector with colonisation and
branching times of each lineage. Can also contain \code{"MinAges"} when these
are available}
}
}
\source{
Jairo Patiño and Rosemary Gilliespie. Full reference list can be
found in the accompanying publication.
}
\usage{
o_m_no_datatable
}
\description{
A dataset containing the colonization and branching times of spiders on Big
Island. This format can be passed to \code{\link[DAISIE:DAISIE_dataprep]{DAISIE::DAISIE_dataprep()}}. Endemicity
status refers strictly to Big Island endemics, and not endemics to the
Hawaiian archipelago in general. This dataset favours immigration and
dos not assume MaxAge for most clades. MinAge is never used when precise
colonisation time is known. Island age is set to 2.4My.
}
\references{
GARB, J.E. and GILLESPIE, R.G. (2009), Diversity despite dispersal:
colonization history and phylogeography of Hawaiian crab spiders inferred
from multilocus genetic data. Molecular Ecology, 18: 1746-1764.
\doi{10.1111/j.1365-294X.2009.04125.x}
}
\keyword{datasets}
