library(tidyverse)
library(tidyr)
library(xlsx)

setwd('C:\\Users\\karis\\Documents\\CambodiaLC\\CambodiaLCAssessment\\Data')

Group1 <- read.xlsx('Sample_Result.xlsx', 1) # read the 1st sheet
Group2 <- read.xlsx('Sample_Result.xlsx', 2) # read the 2nd sheet
Group3 <- read.xlsx('Sample_Result.xlsx', 3) # read the 3rd sheet
Group3dup <- read.xlsx('Sample_Result.xlsx', 4) # read the 4th sheet

head(Group1)
head(Group2)
head(Group3)
head(Group3dup)

Merged <- merge(Group1, Group2, by = c('lon', 'lat'), all=T)
Merged <- merge(Merged, Group3, by = c('lon', 'lat'), all=T)
#Merged <- merge(Merged, Group3dup, by = c('lon', 'lat'), all=T)
head(Merged)

GIS <- mutate(GIS, codedLab = case_when(
  (strata_coded == 100) ~ 'evergreen stable',
  (strata_coded == 103) ~ 'evergreen degradation',
  (strata_coded == 104) ~ 'evergreen forest loss',
  (strata_coded == 200) ~ 'mixed stable',
  (strata_coded == 203) ~ 'mixed degradation',
  (strata_coded == 204) ~ 'mixed loss',
  (strata_coded == 251) ~ 'mixed buffer',
  (strata_coded == 300) ~ 'dipto stable',
  (strata_coded == 303) ~ 'dipto degradation',
  (strata_coded == 304) ~ 'dipto loss',
  TRUE ~ "FixMe"
))
unique(GIS$codedLab)