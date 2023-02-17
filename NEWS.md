# hawaiispiders (development version)

# hawaiispiders 3.0.0

* Add many plotting functions.
* Add analysis functions.
* Status, data and analysis after second round of collaborator input.

# hawaiispiders 2.0.0

-   Completely rework the package. It mostly contains data, all
    functions running analyses have been moved and expanded in the
    [DAISIEutils](https://github.com/tece-lab/DAISIEutils) package.
-   Added data sets which never consider MaxAges.
-   Renamed all data files to more logical names. A key is still found
    at [docs/scenario_description.md](docs/scenario_description.md).
-   Added bash files for submitting ml_model runs of all models, using
    `DAISIEutils` v1.0.0

# hawaiispiders 1.0.1

-   Fix issues in file paths when running on Peregrine.
-   Fix bug in passing verbose argument to `run_main()` function when
    running on Peregrine.
-   Add call to `library(hawaiispiders)` on Peregrine jobscript so lazy
    loading of data to works correctly.
-   Minor formatting in LICENSE.md so it is recognized by GitHub
    properly. License remains GPL-3.

# hawaiispiders 1.0.0

-   Add `is_on_cluster()` to better handle files internally.
-   Improve documentation.
-   Drastically improve test code coverage.
-   Use lazy-loading for data loading, not `load()`.
-   More modular main function. `print_main_header()` now takes care of
    diagnostic printing.
-   Add new `verbose` argument to `run_main()` and friends, which is
    `FALSE` by default.
-   Depend on `devtools` for `devtools::session_info()`.
-   Better file handling in Peregrine HPCC.
-   More informative format for results.

# hawaiispiders 0.0.0.9004

-   Add 2.*.* scenarios (favouring immigration and not cladogenesis).
    Document said scenarios.
-   Add 1.2.1 dataset and documentation.

# hawaiispiders 0.0.0.9003

-   Corrected error in endemicity status for data.
-   Added documentation on data scenarios
    [here](docs/scenario_description.md).
-   Added all finalized scenarios favouring cladogenesis.
-   Improved data and function documentation.

# hawaiispiders 0.0.0.9002

-   Add Bash and R scripts to run the analyses on the Peregrine HPCC.
-   `run_spider_analysis()` will run 1 model, 1 seed. New function
    `run_main()` will call this function for a range of seeds to allow
    automatic MLE on multiple initial parameters. Bash functions are
    found in `/bash` and the R job script lives on `/scripts`.
-   Better status printing at the start of each job.
-   Different, less elegant but functioning strategy to dynamically load
    correct datasets.

# hawaiispiders 0.0.0.9001

-   First minimal functionality. Main function `run_spider_analysis()`
    works. Four different DAISIE model specifications are possible. This
    function can only be called locally as no bash scripts are available
    yet.
-   Added first functioning spider scenario (scenario 1). At the moment
    this is the only scenario with available data that can run in
    `run_spider_analysis()`.
-   Add minimal documentation, tests and coverage check.
-   Added a `NEWS.md` file to track changes to the package.
