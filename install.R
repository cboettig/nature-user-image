#!/usr/bin/env Rscript

# Function to install R packages
install_packages_with_versions <- function(packages) {
  available <- available.packages()
  to_install <- names(packages)[!(names(packages) %in% rownames(installed.packages()))]

  if (length(to_install) > 0) {
    install.packages(to_install, available = available,
                     versions = packages[to_install],
                     dependencies = TRUE)
  } else {
    cat("All packages are already installed.\n")
  }
}

# List of packages to ensure are installed
required_packages <- c("remotes", "devtools")

# Check and install required packages
new_packages <- required_packages[!sapply(required_packages, requireNamespace, quietly = TRUE)]
if (length(new_packages) > 0) {
  install.packages(new_packages)
}

packages = list(
  "IRkernel" = "1.3.2",         # required for jupyter R kernel
  # ESPM-157, Spring 2025
  # https://github.com/berkeley-dsep-infra/datahub/issues/6617
  "duckdbfs" = "0.0.9",
  "gdalcubes" = "0.7.0",
  "mapgl" = "0.2.0",
  "minioclient" = "0.0.6",
  "rstac" = "1.0.1",
  "sf" = "1.0-19",
  "stars" = "0.6-7",
  "terra" = "1.8-10",
  "tidyverse" = "2.0.0"
  # /ESPM-157

  # Ensure that every entry have a comma, except the last one.
)

install_packages_with_versions(packages)
