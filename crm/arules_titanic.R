#https://chandramanitiwary.wordpress.com/2013/10/25/association_rules-cross_sell_r_part1/

require(arules)  # load the package</span>

str(Titanic)

df <- as.data.frame(Titanic) # read the data into a data frame

summary(df)

titanic.raw <- NULL
for(i in 1:4) {
   titanic.raw <- cbind(titanic.raw, rep(as.character(df[,i]), df$Freq))
}
titanic.raw <- as.data.frame(titanic.raw)
names(titanic.raw) <- names(df)[1:4]
dim(titanic.raw)
str(titanic.raw)

rules <- apriori(titanic.raw, control = list(verbose=F),
                 parameter = list(minlen=2, supp=0.005, conf=0.6),
                 appearance = list(rhs=c("Survived=No", "Survived=Yes"),
                                   default="lhs"))

rules

#parameter object of class APparameter or named list. The default behavior is to mine #rules
#with support 0.1, confidence 0.8, and maxlen 10.
#appearance object of class APappearance or named list. With this argument item #appearance can be restricted. By default all items can appear unrestricted.

quality(rules) <- round(quality(rules), digits=3)
  rules.sorted <- sort(rules, by="lift") #sort the rules by lift inspect(rules.sorted) # see the rules

#Removing redundant rules

# find redundant rules
subset.matrix <- is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm=T) >= 1
which(redundant)

# remove redundant rules
rules.pruned <- rules.sorted[!redundant]
inspect(rules.pruned)

