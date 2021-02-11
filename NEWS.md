# hawaiispiders 0.0.0.9003

* Corrected error in endemicity status for data.
* Added documentation on data scenarios [here](docs/scenario_description.md).
* Added all finalized scenarios favouring cladogenesis.
* Improved data and function documentation.

# hawaiispiders 0.0.0.9002

* Add Bash and R scripts to run the analyses on the Peregrine HPCC.
* `run_spider_analysis()` will run 1 model, 1 seed. New function `run_main()` 
will call this function for a range of seeds to allow automatic MLE on multiple
initial parameters. Bash functions are found in `/bash` and the R job script
lives on `/scripts`.
* Better status printing at the start of each job.
* Different, less elegant but functioning strategy to dynamically load correct
datasets.

# hawaiispiders 0.0.0.9001

* First minimal functionality. Main function `run_spider_analysis()` works. Four
different DAISIE model specifications are possible. This function can only be 
called locally as no bash scripts are available yet.
* Added first functioning spider scenario (scenario 1). At the moment this is
the only scenario with available data that can run in `run_spider_analysis()`.
* Add minimal documentation, tests and coverage check.
* Added a `NEWS.md` file to track changes to the package.
