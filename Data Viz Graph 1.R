# Data Viz Graph 1 - Time Series

# Load data
election2 <- read.csv("California Presidential Election.csv", sep=",", header=TRUE)

names(election2) <- c("1960", "1964", "1968", "1972", "1976", "1980", "1984", "1988", "1992", "1996", "2000", "2004", "2008", "2012", "2016")

# Convert to matrix
election2_matrix = as.matrix(election2)

# Pass hot_dog_matrix into a barplot
options(scipen=5)
barplot(election2_matrix, border = NA, space=0.25, las=2,
        xlab="Election Year",
        ylab="Presidential Votes in CA",
        main="Total Presidential Votes in California, 1960-2016",
        col=c("#2196F3","#FF5252","#FFC61C"))
legend("topleft", 
       legend = c("Democratic", "Republican", "Other"), 
       fill = c("#2196F3","#FF5252","#FFC61C"),
       bty="n")
grid(nx=NA, ny=NULL, col="#cccccc", lty="dotted")


#3C64FF nice red or blue, forgot which




### Graph again, but with data divided by 1 mil for axis
election_div <- election2 / 1000000

# Convert to matrix
election_div_matrix = as.matrix(election_div)

# Change margins
par(mar=c(5,6.5,3,1))


## BARPLOT
barplot(election_div_matrix, border = NA, space=0.25,
        xlab="Election Year",
        ylab="",
        main="Total Presidential Votes in California, 1960-2016",
        col=c("#2196F3","#FF5252","#FFC61C"),
        yaxt="n",
        sub="Source: California Secretary of State",
        cex.sub=0.7,
        cex.names=0.8)

# Sets the legend
legend("topleft", 
       legend = c("Democratic Candidate", "Republican Candidate", "Other Candidates"), 
       fill = c("#2196F3","#FF5252","#FFC61C"),
       bty="n",
       cex=0.8)

# Adds the horizontal grid, nx=NA and ny=NULL make it just horizontal
grid(nx=NA, ny=NULL, col="#cccccc", lty="dotted")

# Makes new Y axis formatted the way we want (http://stackoverflow.com/questions/8918452/r-changing-format-of-scale-on-y-axis)
my.axis <-paste(axTicks(2),"mil",sep=" ")
axis(2,at=axTicks(2), labels=my.axis, las=1, cex.axis=0.8)

# More space between y axis labels and title
mtext(side=2, text="Presidential Votes in CA", line=3.5)





## Same graph as above, but with percentages

election_pct <- read.csv("/Users/davidbradford/Documents/Johns Hopkins/Data Visualization/California Presidential Election Pct.csv", sep=",", header=TRUE)

# Change names
names(election_pct) <- c("1960", "1964", "1968", "1972", "1976", "1980", "1984", "1988", "1992", "1996", "2000", "2004", "2008", "2012", "2016")

# Change margins
par(mar=c(5,6.5,3,1))

# Convert to matrix
election_pct_matrix = as.matrix(election_pct)


## BARPLOT
barplot(election_pct_matrix, border = NA, space=0.25,
        xlab="Election Year",
        ylab="",
        main="Total Presidential Votes in California, 1960-2016",
        col=c("#2196F3","#FF5252","#FFC61C"),
        yaxt="n",
        sub="Source: California Secretary of State",
        cex.sub=0.7,
        cex.names=0.8)

# Sets the legend
legend("topleft", 
       legend = c("Democratic Candidate", "Republican Candidate", "Other Candidates"), 
       fill = c("#2196F3","#FF5252","#FFC61C"),
       bty="n",
       cex=0.8)

# Adds the horizontal grid, nx=NA and ny=NULL make it just horizontal
grid(nx=NA, ny=NULL, col="#cccccc", lty="dotted")

# Makes new Y axis formatted the way we want (http://stackoverflow.com/questions/8918452/r-changing-format-of-scale-on-y-axis)
my.axis <-paste(axTicks(2),"mil",sep=" ")
axis(2,at=axTicks(2), labels=my.axis, las=1, cex.axis=0.8)

# More space between y axis labels and title
mtext(side=2, text="Presidential Votes in CA", line=3.5)



### Re-creation of Yau's stacked bar chart

## Already did this part in other R file

# Load the data
# hot_dog_places <- read.csv("http://datasets.flowingdata.com/hot-dog-places.csv", sep=",", header=TRUE)

# R made the year headers into strings by adding X in front of each year. Remove X's.
# names(hot_dog_places) <- c("2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010")

# Convert hot_dog_places from a data frame into a matrix
# hot_dog_matrix = as.matrix(hot_dog_places)

# Pass hot_dog_matrix into a barplot
barplot(hot_dog_matrix, border = NA, space=0.25, las=1,
        ylim=c(0, 200), xlab="Year",
        ylab="Hot dogs and buns (HDBs)",
        main="Top Three Hot Dog Eaters",
        sub="Source: Wikipedia | Nathan Yau",
        cex.sub=0.7,
        cex.axis=0.9,
        cex.names=0.9,
        col=c("#127A4A","#0CAB63","#7FBB4A"))
legend("topleft", 
       legend = c("3rd place", "2nd place", "1st place"), 
       fill = c("#7FBB4A","#0CAB63","#127A4A"),
       bty="n")




barplot(election_div_matrix, border = NA, space=0.25, las=2,
        xlab="Election Year",
        ylab="",
        main="Total Presidential Votes in California, 1960-2016",
        col=c("#2196F3","#FF5252","#FFC61C"),
        yaxt="n")

# Sets the legend
legend("topleft", 
       legend = c("Democratic Candidate", "Republican Candidate", "Other Candidates"), 
       fill = c("#2196F3","#FF5252","#FFC61C"),
       bty="n")

# Adds the horizontal grid, nx=NA and ny=NULL make it just horizontal
grid(nx=NA, ny=NULL, col="#cccccc", lty="dotted")

# Makes new Y axis formatted the way we want (http://stackoverflow.com/questions/8918452/r-changing-format-of-scale-on-y-axis)
my.axis <-paste(axTicks(2),"mil",sep=" ")
axis(2,at=axTicks(2), labels=my.axis, las=1)

# More space between y axis labels and title
mtext(side=2, text="Presidential Votes in CA", line=3.5)