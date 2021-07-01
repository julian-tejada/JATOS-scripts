# Load lybraries
library(readr)

# This code relies on the pacman, tidyverse and jsonlite packages
require(pacman)
p_load('tidyverse', 'jsonlite')

# Define file name and path of the JATOS results
Filename <- 'jatos_results_20210326164028'


# Read the text file from JATOS ...

read_file(Filename) %>%
  # ... split it into lines ...
  str_split('\n') %>% first() %>%
  # ... filter empty rows ...
  discard(function(x) x == '') %>%
  # ... parse JSON into a data.frame
  map_dfr(fromJSON, flatten=T) -> df
