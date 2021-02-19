
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hawaiispiders

<!-- badges: start -->

[![R build
status](https://github.com/Neves-P/hawaiispiders/workflows/R-CMD-check/badge.svg)](https://github.com/Neves-P/hawaiispiders/actions)
[![codecov](https://codecov.io/gh/Neves-P/hawaiispiders/branch/master/graph/badge.svg?token=RXzIKuJ8wa)](https://codecov.io/gh/Neves-P/hawaiispiders)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4544041.svg)](https://doi.org/10.5281/zenodo.4544041)
<!-- badges: end -->

The goal of hawaiispiders is to study the diversification and impact of
geodynamic processes on spider species present on Big Island, Hawaii.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("Neves-P/hawaiispiders")
```

An example call to the main function is:

``` r
run_main(
  datalist_name = "spider_scenario_1_1_1_datalist",
  M = 165,
  model = 1,
  seed_range = 1
)
```

## Support/Questions

For feature requests or bug-reports, please submit an
[issue](https://github.com/Neves-P/hawaiispiders/issues/new).
Alternatively, contact [Neves-P](https://github.com/Neves-P) directly.
