install.packages('dplyr')
library('dplyr')
install.packages('ggplot2')
library('ggplot2')
install.packages("starwars")
library('starwars')
install.packages('ggrepel')
library('ggrepel')
data('starwars')

p <-ggplot(starwars, aes(x=mass, y=height, colour=height)) + #uses starwars data base, x axis is mass, y axis is height, colour adds coulour to points(the taller the lighter the colour)
  geom_point(shape = 20, size = 2, na.rm = TRUE) + #gives the points different shapes, increases the size of points, removes any N\A values if TRUE
  geom_text_repel(aes(label = name), na.rm = TRUE) +
  labs(x='Mass (kg)', y='Height (cm)') + ggtitle('Height and Mass') + #lables x axis, y axis, and gives a title to the graph
  theme(plot.title = element_text(hjust = 0.5, size = 20, color = "#00AFBB")) # moves title to centre, increases size , changes colour
p

h <- ggplot(starwars, aes(x = 1:length(height), y = height, colour = height)) + # x axis represents charcter number in data base(Luke skywalker = 1) makes a sequence from 1 to the length of height, y axis represents height 
  geom_point(shape = 20, size = 2, na.rm = TRUE) +
  geom_text_repel(aes(label = name), na.rm = TRUE, size = 2.5, max.overlaps = 50) +
  labs(x='Character ID', y='Height (cm)') + ggtitle('Height') + 
  theme(plot.title = element_text(hjust = 0.5, size = 20, color = '#00AFBB'))#theme used to customize non data components
h

m <- ggplot(starwars, aes(x = 1:length(mass), y = mass, colour = mass)) + 
  geom_point(shape = 20, size = 2, na.rm = TRUE) + #na.rm silently removes na values thus not giving back a warning message of missing values 
  labs(x ='Character ID', y='Height (cm)') + ggtitle('Mass') +
  theme(plot.title = element_text(hjust = 0.5, size = 20, colour = '#00AFBB'))
m
#ggplot plots values of data frame
#geom_.... plots the values in the graph you chose in this case in points, allows customization to points
