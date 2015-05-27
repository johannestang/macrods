library(gdata)
library(Hmisc)

loadalldata <- function()
{
    unzip("hendryfestschrift_replicationfiles_April28_2008.zip")
	monthly <- read.xls("Hendry/Hendry_Ddisk/data/hendry_data.xls", as.is=TRUE);
    monthly <- monthly[,-c(1,110,111)]
    long <- monthly[1,]
    short <- monthly[2,]
	tcode <- monthly[4,];
	tcodes <- tcode;
	include <- monthly[6,];
	catcode <- monthly[7,];
	scale <- monthly[9,];
	names <- colnames(monthly);
	monthly <- monthly[10:nrow(monthly),];
	monthly <- ts(data.matrix(monthly), start=c(1959,1), frequency=12);
	monthly <- aggregate(monthly, nfrequency=4, FUN=mean);
	rawdata <- monthly;
	data <- c();
	quar <- read.xls("Hendry/Hendry_Ddisk/data/hendry_data.xls", 2, as.is=TRUE);
    quar <- quar[,-1]
    long <- c(long, quar[1,])
    short <- c(short, quar[2,])
	tcode <- quar[3,];
	tcodes <- c(tcodes, tcode);
	include <- c(include, quar[5,]);
	catcode <- c(catcode, quar[6,]);
	scale <- quar[8,];
	names <- c(names, colnames(quar));
    names <- gsub("\\.", "", names)
	quar <- quar[9:nrow(quar),];
	rawdata <- cbind(rawdata, data.matrix(quar));
	idx <- order(as.numeric(catcode));
	names <- names[idx];
	include <- as.numeric(include[idx]);
	tcodes <- as.numeric(tcodes[idx]);
	rawdata <- rawdata[1:nrow(rawdata),idx];
	colnames(rawdata) <- names;
    short <- as.character(short[idx])
    long <- long[idx]
    long <- capitalize(trim(tolower(as.character(long))))
	rawdata <- ts(rawdata, start=c(1959,1), freq=4);
	return(list(include=include, rawdata=rawdata, tcodes=tcodes, shortnames=short, longnames=long));
}

SW2009 <- loadalldata();
save(SW2009, file="../../../data/SW2009.rda");
