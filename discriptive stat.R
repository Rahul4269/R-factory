
e_quakes<-datasets::quakes
e_quakes


#Top 10 rows and last 10 rows
head(e_quakes,10)
tail(e_quakes,10)


#slicing of data

e_quakes[,c(1,2)]
df<-e_quakes[,-6]
e_quakes$lat

#Summary of the data
summary(e_quakes$lat)
summary(e_quakes)


#plot
plot(e_quakes$lat)
plot(e_quakes$lat,e_quakes$long,type="p")
plot(e_quakes)


# points and lines 
plot(e_quakes$lat, type= "l") # p: points, l: lines,b: both
plot(e_quakes$lat, xlab = 'point of measure', 
     ylab = 'No of Instances', main = 'Latitude of city',
     col = 'blue')


# Horizontal bar plot
barplot(e_quakes$long, main = 'Longitude of city',
        ylab = ' levels', col= 'blue',horiz = F,axes=T)

#Histogram
hist(e_quakes$lat)
hist(e_quakes$lat, 
     main = 'Solar Radiation values in air',
     xlab = 'Solar rad.', col='blue')

#Single box plot
boxplot(e_quakes$lat,main="Boxplot")

# Multiple box plots
boxplot(e_quakes[,1:4],main='Multiple')


par(mfrow=c(3,3),mar=c(2,5,2,1),  las=0, bty="o")

plot(e_quakes$lat)
plot(e_quakes$lat, e_quakes$long)
plot(e_quakes$lat, type= "l")
plot(e_quakes$lat, type= "l")
plot(e_quakes$lat, type= "l")
barplot(e_quakes$lat, main = 'Latitude of city',
        xlab = ' levels', col='green',horiz = TRUE)
hist(e_quakes$depth)
boxplot(e_quakes$depth)
boxplot(e_quakes[,0:4], main='Multiple Box plots')



