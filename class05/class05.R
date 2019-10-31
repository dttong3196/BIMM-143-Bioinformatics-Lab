#' ---
#' title: "Class05 Data Exploration and Visualization"
#' author: "Duy Tong"
#' date: "October 31st, 2019"
#' output: github_document
#' ---



# Class5 Data Visualization
x <- rnorm(1000)
# some summary stats
mean(x)
sd(x)
summary(x)
# Summary of Graphs
boxplot(x)
hist(x)
rug(x)

#Section 2 Scatterplots
#lets read our input file first
read.table("bimm143_05_rstats/weight_chart.txt")
baby <- read.table("bimm143_05_rstats/weight_chart.txt")
baby <- read.table("bimm143_05_rstats/weight_chart.txt", header = TRUE)
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header=TRUE)
#Exploring the plot()
plot(weight$Age, weight$Weight)
plot(weight$Age, weight$Weight, type = "o")
plot(weight$Age, weight$Weight, type = "o", pch=15)
plot(weight$Age, weight$Weight, type = "o", pch=15, cex=1.5)
plot(weight$Age, weight$Weight, type = "o", pch=15, cex=1.5, lwd=2)
plot(weight$Age, weight$Weight, type = "o", pch=15, cex=1.5, lwd=2, ylim=c(2,10))
plot(weight$Age, weight$Weight, type = "o", pch=15, cex=1.5, lwd=2, ylim=c(2,10), xlab="Age (months)") 
plot(weight$Age, weight$Weight, type = "o", pch=15, cex=1.5, lwd=2, ylim=c(2,10), xlab="Age (months)", ylab="Weight (kg)")
plot(weight$Age, weight$Weight, type = "o", pch=15, cex=1.5, lwd=2, ylim=c(2,10), xlab="Age (months)", ylab="Weight (kg)", main="Baby weight with age")
plot(weight$Age, weight$Weight, type = "o", pch=15, cex=1.5, lwd=2, ylim=c(2,10), xlab="Age (months)", ylab="Weight (kg)", main="Baby weight with age", col="blue")
# Section 2B Exploring Barplot (Example of mouse GRCm38)
par(mar=c(3, 11, 4, 2))
#Section 2B par(mar) = a way to customize the viewpoint of the graph for better visualization.
mouseGRCm38 <- read.delim("bimm143_05_rstats/feature_counts.txt")
barplot(mouseGRCm38$Count, names.arg = mouseGRCm38$Feature, horiz=TRUE, ylab="", main="Number of features in mouse GRCm38 genome", las=1, xlim=c(0,80000))
# Section 2C (optional) already had an overview in class
x <- c(rnorm(10000), rnorm(10000) +4)
hist(x, breaks = 80)
#Section 3 Providing Color Vectors
read.delim("bimm143_05_rstats/male_female_counts.txt")
Human <- read.delim("bimm143_05_rstats/male_female_counts.txt")
par(mar=c(7,6,4,2))
barplot(Human$Count, names.arg = Human$Sample, col= rainbow(nrow(Human)), las=2, ylab="Counts")
#Could also able to give how much rainbow colors e.i
barplot(Human$Count, names.arg = Human$Sample, col= rainbow(10), las=2, ylab="Counts")
#Section 4 Re-plot
barplot(Human$Count, names.arg = Human$Sample, col = c("blue2", "red2"), las=2, ylab="Counts")
#Section 3B Coloring by Value
read.delim("bimm143_05_rstats/up_down_expression.txt")
expression <- read.delim("bimm143_05_rstats/up_down_expression.txt")
#Find the total genes (How many genes are detailed in this file?)
nrow(expression)
#Determine genes up/down/unchanging in their expression
table(expression$State)
#Plotting the conditions simply black and white
plot(expression$Condition1, expression$Condition2)
#Plotting the conditions with other inputs
plot(expression$Condition1, expression$Condition2, col=expression$State, xlab="Expression Condition 1", ylab="Expression Condition 2")
#Run palette()
palette(c("blue","grey","red"))
plot(expression$Condition1, expression$Condition2, col=expression$State, xlab="Expression Condition 1", ylab="Expression Condition 2")
#Section 3C. Dynamic Use of Color
meth <- read.delim("bimm143_05_rstats/expression_methylation.txt")
nrow(meth)
#Draw scatterplot
plot(meth$gene.meth, meth$expression)
#Improve scatterplot by coloring by point density
dcols <- densCols(meth$gene.meth, meth$expression)
#Plot changing the plot character ('pch') to a solid circle
plot(meth$gene.meth, meth$expression, col = dcols, pch = 20)
#Restrict to genes that have more than zero expression values
#Find the indices of genes with above 0 expression
inds <- meth$expression > 0
#Plot just these genes
plot(meth$gene.meth [inds], meth$expression[inds])
#Make a density color vector for these genes and plot
dcols.custom <- densCols(meth$gene.meth[inds], meth$expression[inds],
                         colramp = colorRampPalette(c("blue2",
                                                      "green2",
                                                      "red2",
                                                      "yellow")) )

plot(meth$gene.meth[inds], meth$expression[inds], 
     col = dcols.custom, pch = 20)
