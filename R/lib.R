#' Retrieve transformed dataset for a given date.
#' 
#' @param ds The raw dataset.
#' @param enddate Data until this date is returned.
#' @param h Forecast horizon.
#' @param vars A vector of names of the variables to be return, or NULL to return all.
#' @param screen Should the data be screened for outliers?
#' @return The transformed dataset.
#' 
#' @export
getmacrodata <- function(ds, enddate, h=0, vars=NULL, screen=FALSE)
{
	data <- window(ds$rawdata, end=enddate);
	names <- colnames(ds$rawdata);
	transcodes <- ds$tcodes;	
	if (!is.null(vars)) idx <- match(vars, names) else idx <- 1:ncol(data);
	data <- data[,idx];
	names <- names[idx];
	transcodes <- transcodes[idx];

	out <- c();
	for (i in 1:length(names)) {
		if (screen) {
			out <- cbind(out, .screendata(.transformdata(data[,names[i]], transcodes[i], h=h))$screeneddata);
		}
		else {
			out <- cbind(out, .transformdata(data[,names[i]], transcodes[i], h=h));
		}
	}
	colnames(out) <- names;
	return(out);
}

.screendata <- function(x)
{
	outliers <- c();
	replacements <- x*0;
	ya <- x;
	yb <- abs(ya-median(ya, na.rm=TRUE));
	yb <- yb > 6*IQR(yb, na.rm=TRUE);
	ya[yb] <- NA;
	outliers <- yb;
	for (j in 1:length(x))
	{	
		if (!is.na(outliers[j]) && outliers[j])
		{
			replacements[j] <- median(x[max(1,(j-5)):(j-1)], na.rm=TRUE);
		}
	}
	screeneddata <- x;
	screeneddata[outliers] <- 0;
	screeneddata <- screeneddata + replacements;
	return(list(screeneddata=screeneddata, outliers=outliers, replacements=replacements));
}

.transformdata <- function(X, trans, h=0)
{
	if (!all(class(X) == "ts")) stop("You must supply a (univariate) time-series object!\n");

	if (h == 0) {
		return(switch(trans,
			   X,
			   diff(X),
			   diff(X, differences=2),
			   log(X),
			   diff(log(X)),
			   diff(log(X), differences=2)))
	} 
	else {
		return(switch(trans,
			   lag(X, h),
			   lag(X, h) - X,
			   (function(X) {
						tmp <- diff((X))
						yth <- tmp*0
						for (H in 1:h) yth <- yth + lag(tmp,h-H+1)
						yth <- yth/h - tmp
						return(yth)
			   })(X),
			   lag(log(X), h),
			   lag(log(X), h) - log(X),
			   (function(X) {
						tmp <- diff(log(X));
						yth <- tmp*0;
						for (H in 1:h) yth <- yth + lag(tmp,h-H+1);
						yth <- yth/h - tmp;
						return(yth); 
			   })(X)))
	}
}

