library(R.matlab)

loadalldata <- function()
{
	tmp <- readMat(unz("Data&ReplicationFiles.zip", "Data&ReplicationFiles/lndata.mat"))
    idx <- seq(1, 7991, 61)
    series <- unlist(tmp$headertext[idx])
	X <- ts(tmp$macrodat[-c(1:60),], start=c(1964, 1), frequency=12)
	colnames(X) <- series
	return(list(rawdata=X, tcodes=as.numeric(tmp$vartype)))
}

LN2010 <- loadalldata();
save(LN2010, file="../../../data/LN2010.rda");
