## Data Viz Graph 6

library(maps)
map("county", "california", col="#606060")

results <- read.csv("/Users/davidbradford/Documents/Johns Hopkins/Data Visualization/California County Election Results 2016 2.csv")

# Colors to use
blue_red_2 <- c("#67040e", "#770510", "#880512", "#980614", "#a80716", "#b90718", "#c9081a", "#d9091d", "#ea091f", "#f60e25", "#f61f33", "#f72f42", "#f73f51", "#f85060", "#f9606f", "#f9707e", "#fa818c", "#fb919b", "#fba1aa", "#fcb2b9", "#fdc2c8", "#fdd2d7",
                
                "#dce3fb", "#cdd7fa", "#becaf8", "#afbef6", "#9fb2f5", "#90a5f3", "#8199f1", "#718df0", "#6280ee", "#5374ec", "#4368ea", "#345be9", "#254fe7", "#1944e2", "#1740d3", "#153bc4", "#1437b4", "#1232a5", "#102d96", "#0f2986", "#0d2477", "#0b1f68")

# Red
#67040e
#880512 =< -50
#a80716 =< -45 & > -50
#c9081a =< -40 & > -45
#ea091f =< -35 & > -40
#f61f33 =< -30 & > -35
#f73f51 =< -25 & > -30
#f9606f =< -20 & > -25
#fa818c =< -15 & > -20
#fba1aa =< -10 & > -15
#fdc2c8 =< -5 & > -10
#fee3e5 < 0 & > -5

# Blue
#eceffd > 0 & < 5
#cdd7fa => 5 & < 10
#afbef6 => 10 & < 15
#90a5f3 => 15 & < 20
#718df0 => 20 & < 25
#5374ec => 25 & < 30
#345be9 => 30 & < 35
#1944e2 => 35 & < 40
#153bc4 => 40 & < 45
#1232a5 => 45 & < 50
#0f2986 => 50 & < 55
#0b1f68 => 55 & < 60
#081649 => 60 & < 65
#050d2b => 65 & < 70
#01040c => 70

# Make scale - this one has four categories
results$color <- NA

results$color[which(results$X2016_dem_margin <= -.50)] <- "#880512"
results$color[which(results$X2016_dem_margin <= -.45 & results$X2016_dem_margin > -.50)] <- "#a80716"
results$color[which(results$X2016_dem_margin <= -.40 & results$X2016_dem_margin > -.45)] <- "#c9081a"
results$color[which(results$X2016_dem_margin <= -.35 & results$X2016_dem_margin > -.40)] <- "#ea091f"
results$color[which(results$X2016_dem_margin <= -.30 & results$X2016_dem_margin > -.35)] <- "#f61f33"
results$color[which(results$X2016_dem_margin <= -.25 & results$X2016_dem_margin > -.30)] <- "#f73f51"
results$color[which(results$X2016_dem_margin <= -.20 & results$X2016_dem_margin > -.25)] <- "#f9606f"
results$color[which(results$X2016_dem_margin <= -.15 & results$X2016_dem_margin > -.20)] <- "#fa818c"
results$color[which(results$X2016_dem_margin <= -.10 & results$X2016_dem_margin > -.15)] <- "#fba1aa"
results$color[which(results$X2016_dem_margin <= -.05 & results$X2016_dem_margin > -.10)] <- "#fdc2c8"
results$color[which(results$X2016_dem_margin < 0 & results$X2016_dem_margin > -.05)] <- "#fee3e5"

results$color[which(results$X2016_dem_margin > 0 & results$X2016_dem_margin < .05)] <- "#eceffd"
results$color[which(results$X2016_dem_margin >= .05 & results$X2016_dem_margin < .10)] <- "#cdd7fa"
results$color[which(results$X2016_dem_margin >= .10 & results$X2016_dem_margin < .15)] <- "#afbef6"
results$color[which(results$X2016_dem_margin >= .15 & results$X2016_dem_margin < .20)] <- "#90a5f3"
results$color[which(results$X2016_dem_margin >= .20 & results$X2016_dem_margin < .25)] <- "#718df0"
results$color[which(results$X2016_dem_margin >= .25 & results$X2016_dem_margin < .30)] <- "#5374ec"
results$color[which(results$X2016_dem_margin >= .30 & results$X2016_dem_margin < .35)] <- "#345be9"
results$color[which(results$X2016_dem_margin >= .35 & results$X2016_dem_margin < .40)] <- "#1944e2"
results$color[which(results$X2016_dem_margin >= .40 & results$X2016_dem_margin < .45)] <- "#153bc4"
results$color[which(results$X2016_dem_margin >= .45 & results$X2016_dem_margin < .50)] <- "#1232a5"
results$color[which(results$X2016_dem_margin >= .50 & results$X2016_dem_margin < .55)] <- "#0f2986"
results$color[which(results$X2016_dem_margin >= .55 & results$X2016_dem_margin < .60)] <- "#0b1f68"
results$color[which(results$X2016_dem_margin >= .60 & results$X2016_dem_margin < .65)] <- "#081649"
results$color[which(results$X2016_dem_margin >= .65 & results$X2016_dem_margin < .70)] <- "#050d2b"
results$color[which(results$X2016_dem_margin >= .70)] <- "#01040c"




# Look at the names of the geographic areas
map("county", "california")$names
map("county", "california", plot=FALSE)$names
map("state", plot=FALSE)$names

# More entities in map package than in our data set, account for that, get rid of extraneous parts of map names
mapnames <- map("county", "california", plot=FALSE)$names
mapnames_clean <- gsub(".*,","",mapnames) # Get rid of the "california," :: .* means all characters that come before and the , means the comma in the name (like california,alameda)

# Match the names (and make our names lower case)
m <- match(mapnames_clean, tolower(results$county))

# Make the final list of colors, index by m
color_final <- results$color[m]

# MAPS
map("county", "california", fill=TRUE, col=color_final, border=NA, resolution=0)
