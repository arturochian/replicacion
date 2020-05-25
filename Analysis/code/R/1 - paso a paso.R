
#Loading packages

# https://stackoverflow.com/questions/35121192/reading-a-pickle-file-pandas-python-data-frame-in-r

# data= pd.read_pickle("../data/modified_exclusions/pt_replication_modified_exclusions_data.pkl")

# install.packages("feather")
library(feather)
library(dplyr)
setwd("~/nudge/Analysis/data/modified_exclusions/")
data=read_feather("pt_replication_modified_exclusions_data.feather")
head(data)
names(data)
#Sample overview
table(data$Sample)


#total 
data  %>%
  group_by(Country) %>%
  summarise(Total_n=n()) %>%
  arrange(desc(Total_n))

# prueba 1
data  %>%
  group_by(Country,Sample) %>%
  summarise(n=n()) 

# prueba 2

data  %>%
  group_by(Country,Sample) %>%
  summarise(n=n()) 

# prueba 3

data  %>%
  group_by(Country,Sample) %>%
  summarise(n=n()) %>%
  pivot_wider(names_from = Sample,values_from = n)

# prueba 4

data  %>%
  group_by(Country,Sample) %>%
  summarise(n=n()) %>%
  pivot_wider(names_from = Sample,values_from = n)

# prueba 5

data  %>%
  group_by(Country,Sample) %>%
  summarise(n=n()) %>%
  pivot_wider(names_from = Sample,values_from = n,values_fill = list(n = 0))

# prueba 5

data  %>%
  group_by(Country,Sample) %>%
  summarise(n=n()) %>%
  pivot_wider(names_from = Sample,values_from = n,values_fill = list(n = 0)) %>%
  mutate(Total_n=Direct+Paid)

# prueba 6

data  %>%
  group_by(Country,Sample) %>%
  summarise(n=n()) %>%
  pivot_wider(names_from = Sample,values_from = n,values_fill = list(n = 0)) %>%
  mutate(Total_n=Direct+Paid) %>%
  arrange(desc(Total_n))
