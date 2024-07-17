install.packages('igraph')
library(igraph)

enron <- load('enron.RData')
edges <- load("edges_w_message.RData")

graph <- graph_from_data_frame(edges.full, directed = TRUE)
print(summary(graph))

dim(edges.full)

