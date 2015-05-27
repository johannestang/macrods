library(xlsx)
loadalldata <- function()
{
    unzip("jlndata.zip", "macro_raw_data.xlsx")
	tmp <- read.xlsx("macro_raw_data.xlsx", sheetName="macrodata")
    info <- read.xlsx("info.xlsx", sheetIndex=1)
    idx <- order(info$Var)
    X <- ts(as.matrix(tmp[,-c(1,2)]), start=c(1960,1), freq=12)
    tcodes <- as.matrix(info$TC[idx])
    names <- as.matrix(info$Short.name[idx])
    desc <- as.matrix(info$Desc[idx])
	return(list(rawdata=X, tcodes=tcodes, names=names, desc=desc))
}

JLN2013 <- loadalldata();
save(JLN2013, file="../../../data/JLN2013.rda");
