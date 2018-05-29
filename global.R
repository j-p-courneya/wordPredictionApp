# Load data for app 
biGramLUT5 <- readRDS("Data/biGramLUT5")
triGramLUT5 <- readRDS("Data/triGramLUT5")
quartGramLUT5 <- readRDS("Data/quartGramLUT5")
uniGramLUT5 <- readRDS("Data/uniGramLUT5")

#Source Functions
source("functions/stupidBackoffFunction.R")
