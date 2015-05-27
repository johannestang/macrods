loadalldata <- function(verbose=FALSE)
{
	X <- NULL;
	tcodes <- c();
    unbal <- c()
    alldesc <- c()
	novars <- 215;

	f <- file("SW2002.DIR", "r");
    zfile <- "wc00.zip"
	for (i in 1:novars)
	{
		s <- readLines(f, n=1);
		varname <- strsplit(substr(s, 1, 8), split=" ")[[1]][1];
		star <- as.integer(substr(s, 25, 25));
		trans <- as.integer(substr(s, 27, 27));
        desc <- substr(s, 30, nchar(s))

		if (verbose) cat(paste("Var: ", varname, " \t: Star - ", star, "\t: Trans - ", trans, "\n", sep=""));
		tcodes <- c(tcodes, trans);
        unbal <- c(unbal, star)
        alldesc <- c(alldesc, desc)
        if (varname != "FYCP90") {
            fname <- paste("Ddisk/WC00/DDisk/Data/", varname, ".p59", sep="")
	    	variable <- as.matrix(read.delim(unz(zfile, fname), header=FALSE));
	    	variable[variable > 1e15] <- NA;
	    	X <- cbind(X, variable);
	    	colnames(X)[ncol(X)] <- varname;
        } else {
            # This one causes some issues
            fname <- paste("Ddisk/WC00/DDisk/Data/", varname, ".P59", sep="")
	    	variable <- as.matrix(read.delim(unz(zfile, fname), header=FALSE));
            variable <- as.numeric(variable[1:492])
	    	variable[variable > 1e15] <- NA;
	    	X <- cbind(X, variable);
	    	colnames(X)[ncol(X)] <- varname;
        }
	}
	X <- ts(X, start=c(1959, 1), frequency=12);
	close(f);
	return(list(rawdata=X, tcodes=tcodes, unbal=unbal, desc=cbind(colnames(X), tcodes, unbal, alldesc)));
}

SW2002 <- loadalldata(TRUE);
save(SW2002, file="../../../data/SW2002.rda");
