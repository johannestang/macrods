loadalldata <- function()
{
	tmp <- read.csv(unz("fred-md-data.zip", "Zip File Final/FRED-MD_2015m1.csv"))
    tcodes <- tmp[1,-1]
	X <- ts(tmp[-1,-1], start=c(1959, 1), frequency=12)
	return(list(rawdata=X, tcodes=tcodes))
}

FREDMD <- loadalldata();
save(FREDMD, file="../../../data/FREDMD.rda");
