# Load lybraries
library(readr)
# set working directory the script file directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# This code relies on the pacman, tidyverse and jsonlite packages
require(pacman)
p_load('tidyverse', 'jsonlite')

# Load the jatos_result file names
Arquivos <- list.files(pattern="jatos_results*")
Banco <- NULL

for (i in Arquivos) {
# Read the text file from JATOS ...

  read_file(i) %>%
    # ... split it into lines ...
    str_split('\n') %>% first() %>%
    # ... filter empty rows ...
    discard(function(x) x == '') %>%
    # ... parse JSON into a data.frame
    map_dfr(fromJSON, flatten=T) -> df
    df["Participante"] <- i
    Banco <- rbind(Banco, df)
  
}
