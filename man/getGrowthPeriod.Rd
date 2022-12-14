% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getGrowthPeriod.R
\name{getGrowthPeriod}
\alias{getGrowthPeriod}
\title{Calculating Growing Degree Days and Lengths of Growth Stages for Various Crops Using Onset Data from ICARDA's Database}
\usage{
getGrowthPeriod(sitecode, crop, base, max, gdd = FALSE)
}
\arguments{
\item{sitecode}{expression. Vector with names of sites from which to extract onset data.}

\item{crop}{character. Type of crop in ICARDA database. See section 'Details' for crops which have calculations available.}

\item{base}{integer. Minimum temperature constraint for the crop.}

\item{max}{integer. Maximum temperature constraint for the crop.}

\item{gdd}{boolean. If \code{TRUE}, returns a data frame containing calculated GDD and accumulated GDD together with climatic variables used for the calculations. Default: FALSE.}
}
\value{
A list object with different data frames depending on specified option in \code{gdd}.
If \code{gdd = TRUE}, the object is a list containing three data frames: the first one with lengths of different growing stages, the second one with original onset data with phenological variables, and the third one with calculated GDD and accumulated GDD for the sites specified in \code{sitecode}.
If \code{gdd = FALSE}, the object is a list containing two data frames: the first one with lengths of different growing stages, and the second one with original onset data with phenological variables for the sites specified in \code{sitecode}.
}
\description{
Calculates growing degree days (GDD) as well as cumulative GDD, and returns a list of various data frames based on specified arguments.
}
\details{
Growing degree days for various crops are calculated using average daily minimum and maximum temperature values obtained from onset data. The temperature constraints specified in \code{base} and \code{max} are first applied before the calculations are done. These constraints ensure very low or high temperatures which prevent growth of a particular crop are not included.
Crops for which GDD calculations are available include: 'Durum wheat', 'Bread wheat', 'Barley', 'Chickpea', 'Lentil'. Each of these can be supplied as options for the argument \code{crop}.
Cumulative GDD values determine the length of different growing stages. Growing stages vary depending on the type of crop. Durum wheat, bread wheat and barley have five growth stages, i.e. beginning of heading, beginning and completion of flowering, and beginning and completion of grain filling. Chickpea and lentil have four growth stages, i.e. beginning of flowering, completion of 50% flowering, beginning of seed filling, and completion of 90% maturity (chickpea) or of full maturity (lentil).
The length of the full growth cycle of the crop for each site is also given in the output data frame.
}
\examples{
if(interactive()){
 # Calculate GDD for durum wheat
 data(durumDaily)
 growth <- getGrowthPeriod(sitecode = durumDaily$site_code,
                           crop = 'Durum wheat', base = 0,
                           max = 35, gdd = TRUE)

 # Get data frame with lengths of growth stages from list
 # object returned
 growth.lengths <- growth[[1]]

 # Get data frame with phenotypic variables from list
 # object returned
 growth.pheno <- growth[[2]]

 # Get data frame with GDD, cumulative GDD and climatic
 # variables from list object returned (when gdd = TRUE)
 growth.gdd <- growth[[3]]
 }
}
\author{
Khadija Aouzal, Zakaria Kehel, Bancy Ngatia
}
