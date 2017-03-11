### Data Viz Graph 2

## Yau graph

# Regular scatter plot

crime_plot <- read.csv("http://datasets.flowingdata.com/crimeRatesByState2005.csv", header=TRUE, sep=",")

# Murder vs. Burglary
plot(crime_plot$murder, crime_plot$burglary)

# Take out DC outlier and U.S. averages
crime2 <- crime_plot[crime_plot$state != "United States",]
crime2 <- crime_plot[crime_plot$state != "District of Columbia",]
plot(crime2$murder, crime2$burglary)

# Change axes
plot(crime2$murder, crime2$burglary, xlim=c(0,10), ylim=c(0,1200))

# LOESS curve
scatter.smooth(crime2$murder, crime2$burglary, xlim=c(0,10),
               ylim=c(0,1200), las=1, bty="n",
               cex.axis=0.8, pch=19, cex=0.5, col="#93BAD4",
               xlab="Murders per 100,000 population",
               ylab="Burglaries per 100,000 population",
               main="Murders Versus Burglaries in the United States",
               lpars = list(col = "#005BAB", lwd = 3, lty = 1))
grid(col="#cccccc", lty="dotted")

# Regression, just for the fun of it
model <- lm(crime$burglary ~ crime$murder)
summary(model)

# Bubble plot

symbols(crime$murder, crime$burglary, circles = crime$population)

# Size the circles based on area instead of radius
radius <- sqrt(crime$population/pi)
# symbols(crime$murder, crime$burglary, circles=radius)
symbols(crime$murder, crime$burglary, circles=radius, inches=0.35,
         fg="white", bg="red", xlab="Murder Rate", ylab="Burglary Rate")
text(crime$murder, crime$burglary, crime$state, cex=0.5)






## My graph

california <- read.csv("/Users/davidbradford/Documents/Johns Hopkins/Data Visualization/California County Election Results 2016.csv")

# 2016 vs. 2012 margin
symbols(california$X2016_dem_margin, california$X2012_dem_margin,
        circles = sqrt(california$total_votes/pi), inches=0.25,
        fg="white", bg="red", xlab = "2016 Democratic Win Margin (Pct Points)",
        ylab="2012 Democratic Win Margin (Pct Points)",
        las=1, bty="n", cex.axis=0.8,
        xlim=c(-0.4,0.8), ylim=c(-0.4,0.8))
text(california$X2016_dem_margin, california$X2012_dem_margin, california$county, cex=0.5)
abline(a=0, b=1, lty=2)

# Clinton pct vs. Marijuana
symbols(california$clinton_pct, california$prop64_yes_pct,
        circles = sqrt(california$total_votes/pi), inches=0.25,
        fg="white", bg="#93BAD4", xlab="Clinton Vote Percentage",
        ylab="Yes on Legalizing Marijuana Percentage",
        las=1, bty="n", cex.axis=0.8, xlim=c(0.2,0.85), ylim=c(0.2,0.85))
text(california$clinton_pct, california$prop64_yes_pct, california$county, cex=0.5)
abline(a=0, b=1, lty=2, col="#cccccc")


## Points instead of bubbles
library(calibrate)
# california$dotsize <- sqrt(california$total_votes / 100000)
california$color <- ""
california$color[which(california$clinton_pct > california$trump_pct)] <- "#93BAD4"
california$color[which(california$clinton_pct < california$trump_pct)] <- "#FCCCD0"
california$color[which(california$clinton_pct > california$trump_pct 
                       & california$romney_pct > california$obama_pct)] <- "#005BAB"
california$color[which(california$clinton_pct < california$trump_pct 
                       & california$romney_pct < california$obama_pct)] <- "#CF3446"


# Plot 2016 margin vs. 2012 margin
plot(california$X2016_dem_margin, california$X2012_dem_margin,
     las=1, xlab="2016 Democratic Margin of Victory",
     ylab="2012 Democratic Margin of Victory",
     main="Change in Democratic Presidential Candidate's Win Margin by California County, 2012-2016",
     bty="n", cex.axis=0.8, pch=19, cex.main=0.9,
     cex=0.5, xlim=c(-0.5,0.85), ylim=c(-0.5,0.85),
     col=california$color)
textxy(california$X2016_dem_margin[california$county=="Orange" | california$county=="Nevada"], california$X2012_dem_margin[california$county=="Orange" | california$county=="Nevada"], california$county[california$county=="Orange" | california$county=="Nevada"], offset = 0.7)
grid(col="#cccccc", lty="dotted")
abline(a = 0, b = 1, lty = 2, lwd = 2, col="#cccccc")
# add color showing which ones went for Clinton and which ones got MORE dem vs. MORE rep



# Plot straight up Clinton vs. Obama percentages, not as interesting as the margin one
plot(california$clinton_pct, california$obama_pct,
     las=1, xlab="Clinton % in 2016",
     ylab="Obama % in 2012",
     main="Change in Democratic Presidential Candidate's Vote Percentage by California County, 2012-2016",
     bty="n", cex=0.5, cex.axis=0.8, pch=19, cex.main=0.9)
textxy(california$clinton_pct, california$obama_pct, california$county)
abline(a = 0, b = 1)


# Clinton % vs. # of votes cast
plot(california$total_votes, california$X2016_dem_margin,
     las=1, xlab="Total Votes Cast in County",
     ylab="Clinton Margin of Victory",
     main="Clinton Won Big in Populous Counties",
     bty="n", cex=0.5, cex.axis=0.8, pch=19, cex.main=0.9,
     xlim=c(0,4000000))
textxy(california$total_votes, california$X2016_dem_margin, california$county)

# Clinton % vs. Repealing Death Penalty
scatter.smooth(california$clinton_pct, california$prop62_yes_pct,
     las=1, xlab="Clinton Vote Percentage",
     ylab="Yes on Repealing Death Penalty Percentage",
     bty="n", cex=0.5, cex.axis=0.8, pch=19, cex.main=0.9,
     lpars = list(col = "#005BAB", lwd = 2, lty = 1),
     xlim=c(0,1), ylim=c(0,1), col="#93BAD4")
textxy(california$clinton_pct, california$prop62_yes_pct, california$county)

# Clinton % vs. Legalizing Marijuana
california$clinton_pct_full <- california$clinton_pct * 100
california$prop64_yes_pct_full <- california$prop64_yes_pct * 100

california$color[which(california$clinton_pct > california$trump_pct)] <- "#93BAD4"
california$color[which(california$clinton_pct < california$trump_pct)] <- "#FCCCD0"
california$color[which(california$prop64_yes_pct > california$prop64_no_pct & california$clinton_pct > california$trump_pct)] <- "#005BAB"
california$color[which(california$prop64_yes_pct < california$prop64_no_pct & california$clinton_pct < california$trump_pct)] <- "#CF3446"

county_highlights <- california$county=="Del Norte" | california$county=="Imperial" | california$county=="Alameda" | california$county=="Contra Costa" |  california$county=="Fresno" | california$county=="Kern" | california$county=="Los Angeles" | california$county=="Riverside" | california$county=="Sacramento" | california$county=="SF" | california$county=="San Mateo" | california$county=="Santa Clara" | california$county=="Ventura" # | california$county=="San Bernardino"

california$cex <- 0.5
california$cex[which(california$county=="Del Norte" | california$county=="Imperial")] <- 0.7


scatter.smooth(california$clinton_pct_full, california$prop64_yes_pct_full,
               las=1, xlab="Clinton Vote Percentage",
               ylab="Yes on Prop 64 Percentage",
               bty="n", cex=0.5, cex.axis=0.8, pch=19, cex.main=0.9,
               col="#93BAD4",
               lpars = list(col = "#005BAB", lwd = 3, lty = 1),
               xaxt="n", yaxt="n",
               main="Clinton Vote vs. Marijuana Legalization Vote in California Counties",
               sub="Source: California Secretary of State",
               cex.sub=0.6, cex.lab=0.9)
textxy(california$clinton_pct_full[county_highlights], california$prop64_yes_pct_full[county_highlights], california$county[county_highlights],
       offset=0.7,
       cex=ifelse(california$county[county_highlights]=="Imperial" | california$county[county_highlights]=="Del Norte", 0.9, 0.6))
my.axis <- paste(axTicks(1),"%",sep="")
axis(1,at=axTicks(1), labels=my.axis, las=1, cex.axis=0.8)
my.axis2 <- paste(axTicks(2),"%",sep="")
axis(2,at=axTicks(2), labels=my.axis, las=1, cex.axis=0.8)
grid(col="#cccccc", lty="dotted")
# abline(a = 0, b = 1, lty=2, col="#cccccc")