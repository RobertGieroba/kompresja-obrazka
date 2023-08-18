library(imager)
library(kohonen)

obrazek <- load.image('oryginal.png')
obrazek2 <- as.array(obrazek)[,,1,]
szer <- dim(obrazek2)[1]
wys <- dim(obrazek2)[2]
dim(obrazek2) <- c(szer*wys,3)
siatka <- somgrid(5,5,topo="rectangular")
siec <- supersom(obrazek2, grid = siatka, rlen=50)
piksele <- predict(siec)$predictions[[1]]
wynik <- matrix(0, nrow=szer*wys, ncol = 3)
for(i in 1:nrow(wynik)){
  wynik[i,] <- piksele[i,]
}
wynik <- as.vector(wynik)
wynik2 <- as.cimg(wynik, dim=c(szer,wys,1,3))
plot(wynik2)
save.image(wynik2,"skompresowany.png")
