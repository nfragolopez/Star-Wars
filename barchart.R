install.packages('dplyr')
library('dplyr')
install.packages('ggplot2')
library('ggplot2')
install.packages("starwars")
library('starwars')
install.packages('ggrepel')
library('ggrepel')
data('starwars')

skin_colour_df <- starwars %>%#creates a new data frame which just includes the chracters skin colour and the number of times it appears
  count(skin_color) %>%
  arrange(desc(n))

skin_colour_df

b <- ggplot(skin_colour_df, aes(x=skin_color, y = n, color = skin_color)) + #uses new data frame and assigns x and y values and different colours to bar
  geom_bar(stat = 'identity', fill = 'white', width = .6) +# creates a bar chart and colours them white with a different colour outline on each
  labs(x='Colour', y='Number of charaters') + # titles x and y values
  ggtitle('Skin Colour of Characters') +# titles the plot
  theme(plot.title = element_text(hjust = 0.5, color = 'darkgrey'), #adds the colour under each bar
                                  axis.text.x = element_text(size = 5), 
                                  axis.text.y = element_text(size = 10)) +
  geom_text(aes(label = n), vjust = -0.5, position = position_dodge(width = 1)) # adds specific values of each colour

b

