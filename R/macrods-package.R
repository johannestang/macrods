#' macrods: A collection of macroeconomic datasets.
#'
#' Note: The package source contains all the original data sets
#' as well as the R scripts used to convert them to R format.
#'
#' @docType package
#' @name macrods-package
NULL

#' US macroeconomic data set from Stock and Watson (2002)
#'
#' A dataset containing 215 monthly US macroeconomic variables
#' spanning the period 1959-1998. The dataset is from Stock and Watson (2002).
#'
#' @format A list with the following:
#' \describe{
#'   \item{rawdata:}{The raw dataset as a matrix where the columns are the variables as time series objects.}
#'   \item{tcodes:}{The transformation codes used to transform the variables to be stationary.}
#'   \item{unbal:}{Boolean vector indicating whether a given variable contains missing values.}
#'   \item{desc:}{A matrix containing descriptions of the variables.}
#' }
#' @source \url{http://www.princeton.edu/~mwatson/ddisk/wc00.zip}.
#'
#' @references Stock, J., Watson, M. (2002). \emph{Macroeconomic forecasting using diffusion indexes}. Journal of Business and Economic Statistics 20(2), 147--162. \url{http://dx.doi.org/10.1198/073500102317351921}
"SW2002"

#' US macroeconomic data set from Ludvigson and Ng (2010)
#'
#' A dataset containing 131 monthly US macroeconomic variables
#' spanning the period 1964-2007. The dataset is from Ludvigson and Ng (2010).
#'
#' @format A list with the following:
#' \describe{
#'   \item{rawdata:}{The raw dataset as a matrix where the columns are the variables as time series objects.}
#'   \item{tcodes:}{The transformation codes used to transform the variables to be stationary.}
#' }
#' @source \url{http://www.econ.nyu.edu/user/ludvigsons/Data&ReplicationFiles.zip}.
#'
#' @references Ludvigson, S. C., Ng, S. (2010) \emph{A Factor Analysis of Bond Risk Premia}. Handbook of Empirical Economics and Finance, 2010, e.d. by Aman Uhla and David E. A. Giles, pp. 313-372. Chapman and Hall, Boca Raton, FL. \url{http://www.econ.nyu.edu/user/ludvigsons/handbook-big.pdf}
"LN2010"

#' US macroeconomic data set from Jurado, Ludvigson and Ng (2013)
#'
#' A dataset containing 132 monthly US macroeconomic variables
#' spanning the period 1960-2011. The dataset is from Jurado, Ludvigson and Ng (2013).
#'
#' @format A list with the following:
#' \describe{
#'   \item{rawdata:}{The raw dataset as a matrix where the columns are the variables as time series objects.}
#'   \item{tcodes:}{The transformation codes used to transform the variables to be stationary.}
#'   \item{names:}{Short names of the variables.}
#'   \item{desc:}{Description of the variables.}
#' }
#' @source \url{http://www.econ.nyu.edu/user/ludvigsons/jlndata.zip}.
#'
#' @references Jurado, K., Ludvigson, S. C., Ng, S. (2013) \emph{Measuring Uncertainty}. \url{http://www.econ.nyu.edu/user/ludvigsons/jln.pdf}
"JLN2013"

#' FRED-MD: A Monthly Database for Macroeconomic Research 
#'
#' A dataset containing 134 monthly US macroeconomic variables
#' spanning the period 1959-2014. 
#'
#' @format A list with the following:
#' \describe{
#'   \item{rawdata:}{The raw dataset as a matrix where the columns are the variables as time series objects.}
#'   \item{tcodes:}{The transformation codes used to transform the variables to be stationary.}
#' }
#' @source \url{http://research.stlouisfed.org/econ/mccracken/fred-md-data.zip}.
#'
#' @references McCracken, M. W., Ng, S. (2014) \emph{FRED-MD: A Monthly Database for Macroeconomic Research}. \url{http://www.columbia.edu/~sn2294/papers/freddata.pdf}
"FREDMD"

#' US macroeconomic data set from Stock and Watson (2009)
#'
#' A dataset containing 187 monthly US macroeconomic variables
#' spanning the period 1959-2006. The dataset is from Stock and Watson (2009).
#'
#' @format A list with the following:
#' \describe{
#'   \item{rawdata:}{The raw dataset as a matrix where the columns are the variables as time series objects.}
#'   \item{tcodes:}{The transformation codes used to transform the variables to be stationary.}
#'   \item{desc:}{A matrix containing descriptions of the variables.}
#'   \item{shortnames:}{Short names of the variables.}
#'   \item{longnames:}{Description of the variables.}
#' }
#' @source \url{http://www.princeton.edu/~mwatson/ddisk/hendryfestschrift_replicationfiles_April28_2008.zip}.
#'
#' @references Stock, J. and M. Watson (2009). \emph{Forecasting in dynamic factor models subject to structural instability}. In J. Castle and N. Shephard (Eds.), The Methodology and Practice of Econometrics: A Festschrift in Honour of David F. Hendry, pp. 173-205. Oxford University Press. 
"SW2009"

