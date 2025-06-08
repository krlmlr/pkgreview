
# pkgreview

<!-- badges: start -->
<!-- badges: end -->

The goal of pkgreview is to provide tools for reviewing other CRAN packages.
Works for me on my system (hard-coded paths and IDE preferences).

## Installation

You can install the development version of pkgreview from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("krlmlr/pkgreview")
```

## Use

``` r
pkgreview::pkg_review("tibble")
```

