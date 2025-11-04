library(jpeg)


img = readJPEG("./figs/04-02-goldy-hockey.jpg")    

Npixels = prod(dim(img)[1:2])
Rpixels = sample(Npixels, 0.6 * Npixels) # randomly select 40% of the pixels
img[ , , 1][Rpixels] = 1 # set the red layer to one in selected pixels
img[ , , 2][Rpixels] = 1 # set blue and green to zero
img[ , , 3][Rpixels] = 1



par(mai = c(0, 0, 0, 0))
plot.new()
rasterImage(img, 0, 0, 1, 1)

jpeg::writeJPEG(img, "./figs/04-03-goldy-hockey-sampled.jpg")
