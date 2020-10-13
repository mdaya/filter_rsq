args <- commandArgs(trailingOnly = TRUE)
info.gz.file=args[1]
min.rsq=as.numeric(args[2])
out.file.name=args[3]

info <- read.delim(gzfile(info.gz.file), stringsAsFactors=F)
info$Rsq_num <- as.numeric(info$Rsq)
extracted.rows <- (info$Genotyped == "Typed_Only") | (!is.na(info$Rsq_num) & (info$Rsq_num >= min.rsq))  
snps <- info$SNP[extracted.rows]

write.table(snps, out.file.name,  sep="\t", quote=F, row.names=F, col.names=F)


