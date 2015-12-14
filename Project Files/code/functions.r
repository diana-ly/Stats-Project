# This R Script documents the functions we use in our Project.

# For Part 1 Visualization: Calculating the correlation coefficient
corr_eqn <- function(x, y, digits = 2) {
  # Given two numeric columns, finds and returns the correlation coefficent 
  # in numeric value (rounded to two digits)
  
  # Input: x = numeric column, y = another numeric column, 
  #        digits = number of digits to round to
  
  # Output: the Correlation Coefficient R, in character
  
  corr_coef <- round(cor(x,y), digits = digits)
  paste("italic(r) == ", corr_coef)
}


# For Part 1 and Part 2 Data Cleaning: Getting only one stat of a player for 
# For players traded during the season.
# Note: For some odd reason, subsetting with "-" did not completely work,
# so we came up with a different algorithm, which is using a logical vector.

unique_data <- function(df, column){
  # Given a data frame and a name of column (in character string), returns a 
  # logical value whether the value in column is the first one to appear or not
  
  # Input: df = data frame, 
  #        column = name of user-selected column (in character string)
  
  # Output: a logical vector indicating whether the value in the column for 
  # each index is the first one to appear or not
      # a logical vector intended for logical subsetting of a data frame
  
  unique_value <- character()
  keep <- logical()
  for(i in 1:nrow(df)){
    if(subset(df, select = column)[i, 1] %in% unique_value){
    # if the value in the column is already in unique_value
      keep[i] <- F
      }
    else {
      keep[i] <- T
      unique_value <- c(unique_value, subset(df, select = column)[i, 1])
        # appending the first value to appear to unique_value to prevent 
        # future occurences
    }
  }
  return(keep)
}