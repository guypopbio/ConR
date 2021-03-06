% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/IUCNeval.functionv11.R
\name{map.res}
\alias{map.res}
\title{Mapping in grid cell results of IUCN.eval}
\usage{
map.res(
  Results,
  Occurrences,
  country_map = NULL,
  Resol = 1,
  threshold = 0,
  LatMin = NULL,
  LatMax = NULL,
  LongMin = NULL,
  LongMax = NULL,
  export_map = FALSE,
  file_name = NULL,
  export_data = FALSE
)
}
\arguments{
\item{Results}{The default output of \code{\link{IUCN.eval}} applied to
multiple species}

\item{Occurrences}{A \code{dataframe}, see Details}

\item{country_map}{A \code{SpatialPolygonsDataFrame} or
\code{SpatialPolygons} showing for example countries or continent borders}

\item{Resol}{numeric , resolution in decimal degrees}

\item{threshold}{numeric, only grid cells with at least this number of
records will be shown}

\item{LatMin}{numeric, minimum latitude for the map}

\item{LatMax}{numeric, maximum latitude for the map}

\item{LongMin}{numeric, minimum longitude for the map}

\item{LongMax}{numeric, maximum longitude for the map}

\item{export_map}{logical, if TRUE, four maps in png will be created in the
working directory if FALSE, maps will be displayed in the R session}

\item{file_name}{character string. Name of the file}

\item{export_data}{logical. If TRUE, a \code{dataframe} containing all
information on the grid cell mapped is exported}
}
\value{
Produce four maps either in the R session (if \code{export_map} is
FALSE) or in png format in the working directory (if \code{export_map} is
TRUE)

If \code{export_data} is TRUE

\strong{Output} \tabular{cccccccc}{ [,1] \tab X \tab numeric, x coordinates
of cell [,2] \tab Y \tab numeric, y coordinates of cell [,3] \tab meanLat
\tab numeric, mean latitude of occurrences within cell\cr [,4] \tab meanLat
\tab numeric, mean longitude of occurrences within cell\cr [,5] \tab NbeRec
\tab numeric, Number of records\cr [,6] \tab NbeEsp \tab numeric, Number of
species\cr [,7] \tab NbeThreatened \tab numeric, Number of threatened
species\cr [,8] \tab PropThreatened \tab numeric, Proportion of threatened
species\cr }
}
\description{
Provides four maps showing in grid cells of a given resolution : number of
records, species richness, number of threatened species (CR+EN+VU) and
proportion of threatened species. Based on \code{\link[fields]{quilt.plot}}.
}
\details{
\strong{Input} \code{Occurrences} as a \code{dataframe} should have the
following structure:

\strong{It is mandatory to respect field positions, but field names do not
matter}

\tabular{ccc}{ [,1] \tab ddlat \tab numeric, latitude (in decimal
degrees)\cr [,2] \tab ddlon \tab numeric, longitude (in decimal degrees)\cr
[,3] \tab tax \tab character or factor, taxa names\cr }
}
\examples{

\dontrun{
data(land)
data(Malagasy_amphibian)
Results <- IUCN.eval(Malagasy_amphibian, DrawMap=FALSE, country_map=land, SubPop=FALSE)
### This should run for 3 to 6 minutes depending of the computer.

### Maps covering the whole dataset with a minimum of 5 records in each cell
map.res(Results=Results, Occurrences=Malagasy_amphibian, country_map=land, 
export_map=FALSE, threshold=5)

## Maps focusing on Madagascar with a minimum of 5 records in each cell
map.res(Results=Results, Occurrences=Malagasy_amphibian, country_map=land, export_map=FALSE, 
	threshold=5, LatMin=-25,LatMax=-12,LongMin=42, LongMax=52)

## Maps focusing on Madagascar at half degree resolution with a minimum of 5 records in each cell
map.res(Results=Results, Occurrences=Malagasy_amphibian, country_map=land, 
export_map=FALSE,Resol=0.5, 
	threshold=5, LatMin=-25,LatMax=-12,LongMin=42, LongMax=52)

## Maps have been exported in the directory IUCN__results_map
map.res(Results=Results, Occurrences=Malagasy_amphibian, country_map=land, export_map=TRUE, 
	threshold=5, LatMin=-25,LatMax=-12,LongMin=42, LongMax=52)

## Install speciesgeocodeR package for an example with their lemurs dataset
library(speciesgeocodeR)
data("lemurs_in")

Results <- IUCN.eval(lemurs_in, DrawMap=FALSE, country_map=land, SubPop=FALSE)

map.res(Results=Results, Occurrences=lemurs_in, country_map=land, export_map=FALSE, threshold=3, 
	LatMin=-25,LatMax=-12,LongMin=42, LongMax=52, Resol=1)

}

}
\seealso{
package fields function quilt.plot
}
\author{
Gilles Dauby
}
