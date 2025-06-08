#' Review a CRAN package
#'
#' This function is used to review a CRAN package by cloning it from the CRAN repository,
#' rebasing it to the latest version if needed, opening RStudio IDE, and optionally
#' installing the package's dependencies using `pak`.
#'
#' It is in a package because a standalone is not a good fit.
#'
#' @param pkg The name of the package to review.
#' @param pak Logical, whether to install the package dependencies using [pak::pak()].
#'
#' @export
pkg_review <- function(pkg, pak = TRUE) {
  base_path <- "~/git/R/cran"
  fs::dir_create(base_path)

  pkg_path <- fs::path(base_path, pkg)

  if (fs::dir_exists(pkg_path)) {
    system(paste0("git -C ", pkg_path, " fetch"))
    system(paste0("git -C ", pkg_path, " rebase"))
  } else {
    system(paste0("git -C ", base_path, " clone git@github.com:cran/", pkg))
  }

  withr::local_dir(pkg_path)
  system("rh")

  if (pak) {
    pak::pak(pkg, dependencies = TRUE, upgrade = TRUE, ask = FALSE)
  }

  cli::cli_alert_info("Ready.")
}
