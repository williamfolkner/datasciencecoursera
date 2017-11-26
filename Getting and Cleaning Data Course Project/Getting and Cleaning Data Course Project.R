library(dplyr)

#### Reading and appending data ####

# Getting lists of files

files.list.test <-
  list.files('./Data/UCI HAR Dataset/test/', recursive = TRUE)
files.list.train <-
  list.files('./Data/UCI HAR Dataset/train/', recursive = TRUE)

# Reading and writing

for (i in (1:length(files.list.test))) {
  filename <-
    paste0('./Data/UCI HAR Dataset/test/', files.list.test[i])
  
  dt <- read.table(filename, sep = "\t", stringsAsFactors = F)
  
  colnames(dt) <- gsub(".*/", "", gsub("\\..*", "", files.list.test[i]))
  
  if (i == 1) {
    data <- dt
  } else {
    data[i] <-  dt
  }
}

for (i in (1:length(files.list.train))) {
  filename <-
    paste0('./Data/UCI HAR Dataset/train/', files.list.train[i])
  
  dt <- read.table(filename, sep = "\t", stringsAsFactors = F)
  
  colnames(dt) <-
    gsub(".*/", "", gsub("\\..*", "", files.list.train[i]))
  
  data[length(files.list.test) + i] <-  dt
  
}

# Reading info tables

activity.labels <-
  read.table(
    './Data/UCI HAR Dataset/activity_labels.txt',
    sep = " ",
    stringsAsFactors = F
  )

colnames(activity.labels) <- c("class.label", "activity.name")

features <-
  read.table('./Data/UCI HAR Dataset/features.txt',
             sep = " ",
             stringsAsFactors = F)

colnames(features) <- c("feature.label", "feature")


