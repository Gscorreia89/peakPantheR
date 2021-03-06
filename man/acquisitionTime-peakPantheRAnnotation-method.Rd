% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods_peakPantheRAnnotation.R
\docType{methods}
\name{acquisitionTime,peakPantheRAnnotation-method}
\alias{acquisitionTime,peakPantheRAnnotation-method}
\alias{acquisitionTime}
\title{acquisitionTime accessor returns value as.POSIXct}
\usage{
\S4method{acquisitionTime}{peakPantheRAnnotation}(object)
}
\arguments{
\item{object}{peakPantheRAnnotation}
}
\value{
(POSIXct) A character vector of acquisition date-time (converted from
POSIXct) or NA
}
\description{
acquisitionTime accessor returns value as.POSIXct
}
\examples{
if(requireNamespace('faahKO')){
## Initialise a peakPantheRAnnotation object with 3 samples and 2 targeted
## compounds

# Paths to spectra files
library(faahKO)
spectraPaths <- c(system.file('cdf/KO/ko15.CDF', package = 'faahKO'),
                    system.file('cdf/KO/ko16.CDF', package = 'faahKO'),
                    system.file('cdf/KO/ko18.CDF', package = 'faahKO'))

# targetFeatTable
targetFeatTable <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(),
                c('cpdID', 'cpdName', 'rtMin', 'rt', 'rtMax', 'mzMin', 'mz',
                'mzMax'))), stringsAsFactors=FALSE)
targetFeatTable[1,] <- c('ID-1', 'Cpd 1', 3310., 3344.888, 3390., 522.194778,
                        522.2, 522.205222)
targetFeatTable[2,] <- c('ID-2', 'Cpd 2', 3280., 3385.577, 3440., 496.195038,
                        496.2, 496.204962)
targetFeatTable[,c(3:8)] <- vapply(targetFeatTable[,c(3:8)], as.numeric,
                                    FUN.VALUE=numeric(2))

annotation <- peakPantheRAnnotation(spectraPaths=spectraPaths,
                                    targetFeatTable=targetFeatTable)

## acquisitionTime can only be extracted from NetCDF files
acquisitionTime(annotation)
# [1] NA NA NA
}
}
