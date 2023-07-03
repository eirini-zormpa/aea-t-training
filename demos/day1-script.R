# simple maths in R
3+5
12/5
3*67

# assign values to objects
weight_kg <- 55
(weight_kg <- 55)
weight_kg

weight_lb <- weight_kg * 2.2

weight_kg <- 100
weight_Kg <- 100

weight_lb <- weight_kg * 2.2

# exercise 1
mass <- 4              # 4
volume <- 12           # 12
mass <- mass * 2       # 8
volume <- volume - 2   # 10
density <- mass/volume

# functions
round(3.14159)
args(round)

round(3.14159, digits = 2)
round(3.14159, 2)

round(digits = 2, 3.14159)
# this does not work properly
round(2, 3.14159)

round(density)

# vectors
heights_cm <- c(56, 68, 43, 75, 60)
manufacture_technique <- c("coil", "wheel", "coil", "pinch", "wheel")

heights_cm <- c(heights_cm, 57)
heights_cm <- c(45, heights_cm)
heights_cm

manufacture_technique <- c("pinch", manufacture_technique, "wheel")
manufacture_technique

length(manufacture_technique)
length(heights_cm)

class(manufacture_technique)
class(heights_cm)

str(manufacture_technique)
str(heights_cm)

# exercise 2
num_char <- c(1, 2, 3, "a")
typeof(num_char)
num_logical <- c(1, 2, 3, TRUE)
typeof(num_logical)
num_logical
char_logical <- c("a", "b", "c", TRUE)
typeof(char_logical)
char_logical
tricky <- c(1, 2, 3, "4")
typeof(tricky)
tricky

# subsetting vectors
heights_cm[3]
heights_cm

heights_cm[c(2, 3)]
heights_cm[c(2, 3, 5, 4, 2, 6, 4)]

# conditional subsetting
heights_cm[c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)]
10 < 20

heights_cm[heights_cm > 55]
heights_cm[heights_cm > 55 & heights_cm < 70]

manufacture_technique
manufacture_technique[manufacture_technique == "coil" | manufacture_technique == "wheel"]
manufacture_technique[manufacture_technique != "pinch"]

# irrelevant (:
#x = 10
#y <- 10

# %in%
good_manufacture_techniques <- c("coil", "wheel")
manufacture_technique[manufacture_technique %in% good_manufacture_techniques]

animals <- c("cat", "dog", "goat", "crocodile", "rhino", "sheep")
farm_animals <- c("cat", "dog", "goat", "sheep")

animals[animals %in% farm_animals]

# working with missing values
heights_cm <- c(45, 56, 68, 43, 75, NA, 57)
heights_cm

mean(heights_cm)
min(heights_cm)
max(heights_cm)

mean(heights_cm, na.rm = TRUE)
min(heights_cm, na.rm = TRUE)
max(heights_cm, na.rm = TRUE)

is.na(heights_cm)
heights_cm[!is.na(heights_cm)]

#na.omit(heights_cm)
complete.cases(heights_cm)
heights_cm[complete.cases((heights_cm))]

# exercise 4
heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)

# get rid of NAs
heights_no_na <- heights[!is.na(heights)]
heights_no_na

height_no_na_2 <- heights[complete.cases(heights)]
height_no_na_2

# calculate the median
heights_median <- median(heights, na.rm = TRUE)
heights_median

# find out how many artefacts are taller than 65
## first we create a vector with artefacts taller than 65
tall_artefacts <- heights[heights > 65]
tall_artefacts

## then we remove the NAs
tall_artefacts <- tall_artefacts[!is.na(tall_artefacts)]
tall_artefacts

## finally we count the remaining artefacts
length(tall_artefacts)

# create separate folders for the raw and clean data
dir.create("data_raw")
dir.create("data_clean")

# only if you don't have one already, create a folder for the scripts
# dir.create("scripts")

# download data file
download.file(url = "https://zenodo.org/record/6478181/files/ceramics_data.csv?download=1",
              destfile = "data_raw/ceramics_data.csv")

library(tidyverse)
surveys <- read_csv("data_raw/ceramics_data.csv")
surveys

head(surveys, n = 10)
tail(surveys, n = 15)

str(surveys)
glimpse(surveys)

summary(surveys)

nrow(surveys)
ncol(surveys)
dim(surveys)

# subset dataframes/tibbles
# row, column
surveys[1, 4]
surveys[106, 7]

surveys[1, ]
surveys[78, ]

surveys[, 7]
surveys[7]

surveys[1:5]
surveys[c(1:3, 5), ]
surveys[1:6, ] # equivalent to head(surveys)

# surveys[, -4]

# return as vector
period_vector <- surveys[[7]]
period_tibble <- surveys[7]

surveys$period

# exercise
# 200th row
surveys_200 <- surveys[200, ]

# last row
surveys_last <- surveys[nrow(surveys), ]
tail(surveys, n = 1)

# middle row
surveys_middle <- surveys[nrow(surveys)/2, ]

# factors
diagnostic_factor <- factor(surveys$diagnostic)
surveys$diagnostic <- factor(surveys$diagnostic)

levels(surveys$diagnostic)
surveys$diagnostic <- factor(surveys$diagnostic, levels = c("rim", "base"))
levels(surveys$diagnostic)

nlevels(surveys$diagnostic)

surveys$manufacture_technique <- factor(surveys$manufacture_technique)
surveys$decoration_type <- factor(surveys$decoration_type)

nlevels(surveys$decoration_type)
levels(surveys$manufacture_technique)

summary(surveys$manufacture_technique)

# converting factors
surveys$manufacture_technique <- as.character(surveys$manufacture_technique)

month <- factor(surveys$month)
month

month_num <- as.numeric(month)

year_factor <- factor(c(1990, 1996, 1995, 1989))
year_numberic <- as.numeric((year_factor))
year_numberic

year_numeric <- as.numeric(as.character(year_factor))
year_numeric

year_numeric <- as.numeric(levels(year_factor))[year_factor]
year_numeric
