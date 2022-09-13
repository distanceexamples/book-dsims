
load("density.surface.robj")
density <- make.density(region = region, x.space = 1000, y.space = 1000, constant = 1)

pts = as.matrix(density.surface[[1]])
mp1 = st_multipoint(pts)
mp2 = st_cast(mp1, to = "POINT")

library(proxy)
old.density=data.frame(x=density.surface[[1]]$x,y=density.surface[[1]]$y)
new.density=data.frame(x=density@density.surface[[1]]$x,y=density@density.surface[[1]]$y)

dists <- dist(new.density, old.density, method = "euclidean")
min.index <- apply(tmp, 1, FUN = function(x){return(which(x == min(x)))})
new.densities <- density.surface[[1]]$density[min.index]
density@density.surface[[1]]$density <- new.densities

#NOTE: you will need to edit the path argument to describe where the files are on your machine. Look back to the path you found when you were setting up and add "/Survey Transects/Subjective Design". 