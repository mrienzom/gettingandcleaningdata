## Combines the data in the UCI HAR Dataset folder into a single, tidy dataframe
## including the mean and sd of measurements from both the training and test 
## groups

run_analysis <- function() {
        
        ## Loads all required packages
        
        library(plyr)
        library(tidyr)
        library(qdap)
        library(dplyr)
        
        ## Loads all relevant files into R as a list of dataframes and names 
        ## them appropriately
        
        filepaths <- list("UCI HAR Dataset/features.txt",
                   "UCI HAR Dataset/activity_labels.txt",
                   "UCI HAR Dataset/test/subject_test.txt",
                   "UCI HAR Dataset/test/X_test.txt",
                   "UCI HAR Dataset/test/y_test.txt",
                   "UCI HAR Dataset/train/subject_train.txt",
                   "UCI HAR Dataset/train/X_train.txt",
                   "UCI HAR Dataset/train/y_train.txt")
        alldata <- lapply(filepaths, read.table, stringsAsFactors = FALSE)
        new.names <- c("features", "activitylabels", "subjecttest", 
                       "xtest", "ytest", "subjecttrain", "xtrain", 
                       "ytrain")
        alldata <- setNames(alldata, new.names)
        
        ## Combines the complete results data into a single dataframe and
        ## removes the undesired variables
        
        results <- rbind(alldata$xtrain, alldata$xtest)
        goodvs <- grepl("mean\\(\\)|std\\(\\)", alldata$features[[2]])
        trimmed <- results[,goodvs]
        colnames(trimmed) <- alldata$features[[2]][goodvs]
        
        ## Adds the subject and activity data to each entry
        
        subjects <- rbind(alldata$subjecttrain, alldata$subjecttest)
        activities <- rbind(alldata$ytrain, alldata$ytest)
        full <- trimmed %>%
                mutate(subject = subjects[[1]], activity = activities[[1]])
        
        ## Tidies and splits variable names
        
        names <- tolower(names(full))
        magvector <- grepl("mag", names)
        jerkvector <- grepl("jerk", names)
        delete <- c("\\(", "\\)", "mag", "jerk") 
        subfrom <- c("body", "gravity", "^f", "^t")
        subto <- c("body-","gravity-", "f-", "t-")
        names <- sub("bodybody", "body", names)
        names <- mgsub(delete, "", names, fixed = FALSE)
        names <- mgsub(subfrom, subto, names, fixed = FALSE)
        names[magvector] <- paste(names[magvector], "-mag", sep = "")
        names[jerkvector] <- paste(names[jerkvector], "-yes", sep = "")
        colnames(full) <- names
        
        ## Gathers and splits the variable names by id values
        
        tidy <- full %>%
                gather("domain-component-source-statistic-direction-jerk",
                       "measurement", -(subject:activity)) %>%
                separate("domain-component-source-statistic-direction-jerk", 
                         c("domain","component","source","statistic",
                           "direction","jerk"), fill = "right")
        
        ## Replaces some entries with descriptive names
        
        tidy$jerk[is.na(tidy$jerk)] <- "no"
        tidy$activity <- tolower(mapvalues(tidy$activity, 
                                           alldata$activitylabels$V1, 
                                           alldata$activitylabels$V2))
        
        ## Generates a second table with averages of each measurement for each
        ## subject and activity
        
        summary <- tidy %>%
                group_by(subject, activity, domain, component, source, 
                         statistic, direction, jerk) %>%
                summarize(average = mean(measurement), 
                          count = length(measurement))
        return(summary)
        }