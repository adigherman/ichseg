% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deepbleed.R
\name{download_deepbleed_model}
\alias{download_deepbleed_model}
\alias{load_deepbleed_model}
\alias{predict_deepbleed}
\alias{register_deepbleed}
\title{DeepBleed Model}
\usage{
download_deepbleed_model(outdir = NULL)

load_deepbleed_model(outdir = NULL)

predict_deepbleed(image, mask = NULL, verbose = TRUE, ..., outdir = NULL)

register_deepbleed(
  image,
  mask = NULL,
  verbose = TRUE,
  interpolator = "Linear",
  ...
)
}
\arguments{
\item{outdir}{Output directory for `DeepBleed` model}

\item{image}{image to segment using `DeepBleed` model}

\item{mask}{brain mask image}

\item{verbose}{print diagnostic messages}

\item{...}{additional arguments to send to
\code{\link{CT_Skull_Stripper_mask}}}

\item{interpolator}{interpolation done for antsApplyTransforms}
}
\value{
A list of the output images and predictions.
}
\description{
DeepBleed Model
}
\note{
\url{https://github.com/muschellij2/deepbleed}
}
\examples{
\dontrun{
destfile = file.path(tempdir(), "01.tar.xz")
dl = download.file(
  "https://archive.data.jhu.edu/api/access/datafile/1311?gbrecs=true",
  destfile = destfile)
res = untar(tarfile = destfile, exdir = tempdir())
fname = file.path(tempdir(), "01", "BRAIN_1_Anonymized.nii.gz")
mask = file.path(tempdir(), "01", "BRAIN_1_Anonymized_Mask.nii.gz")
tdir = tempfile()
dir.create(tdir)
download_deepbleed_model(outdir = tdir)
mod = load_deepbleed_model(outdir = tdir)
predict_deepbleed(fname, mask = mask, outdir = tdir)
}
}
