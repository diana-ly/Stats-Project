
# This code for Visualization of Player Stats and Salaries will output
# Correlation visualizations for different player stats based on 
# their positions, in respect to salary

library(ggplot2)
library(scales)

source("./code/functions.r")
# See functions.r for more details on corr_eqn function used in the plots

# In this case we do not use source to bring multiple R objects, 
# simply because it takes a little more time,
# and also most of the sourced data and objects is not necessary. We assume
# that the project reader has ran `cleaning_roster_salary_stats` file, and have
# access to the `roster_salary_stats.csv` file.
final_roster <- 
  read.csv("./data/roster_salary_stats.csv", stringsAsFactors = F)

### DATA VISUALIZATION

#### 1. POINT GUARD Correlation plot

point_guard <- final_roster[final_roster$Pos == 'PG', ]
ggplot(point_guard, aes(x = point_guard$Salary, y = point_guard$AST)) +
  geom_point() +
  geom_smooth(method = 'lm') +
  labs(x = 'Salary in USD ($)', y = 'Assist') + 
  scale_x_continuous(labels = dollar) + 
  ggtitle('Point Guard Salary and Assist Correlation') +
  geom_text(aes(x = 15000000, y = 400, 
                label = corr_eqn(point_guard$AST,point_guard$Salary)), 
            parse = TRUE, colour = "#ff0000")

#### 2. CENTER Correlation plot

center <- final_roster[final_roster$Pos == 'C',]
ggplot(center, aes(x = center$Salary, y = center$TRB)) +
  geom_point() +
  geom_smooth(method = 'lm') +
  scale_x_continuous(labels = dollar) + 
  labs(x = 'Salary', y = 'Total Rebounds') +
  ggtitle('Center Salary and Rebounds Correlation') +
  geom_text(aes(x = 1.6e+07, y = 320, 
                label = corr_eqn(center$ORB, center$Salary)), 
            parse = TRUE, colour = "#ff0000")

#### 3. SMALL FORWARD Correlation plot
small_forward <- final_roster[final_roster$Pos == 'SF', ]
ggplot(small_forward, aes(x = small_forward$Salary, 
                          y = small_forward$X3P.)) +
  geom_point() +
  geom_smooth(method = 'lm') +
  labs(x = 'Salary', y = '3 Points Percentage') +
  scale_x_continuous(labels = dollar) + 
  ggtitle('Small Forward Salary and 3 Points Percentage Correlation') +
  geom_text(aes(x = 1.5e+07, y = 0.3, 
                label = corr_eqn(small_forward$X3P, small_forward$Salary)),
            parse = TRUE, colour = "#ff0000")

#### 4. POWER FORWARD Correlation plot

power_forward <- final_roster[final_roster$Pos == 'PF', ]
ggplot(power_forward, aes(x = power_forward$Salary, y = power_forward$TRB)) +
  geom_point() +
  geom_smooth(method = 'lm') +
  labs(x = 'Salary', y = 'Total Rebounds') +
  scale_x_continuous(labels = dollar) + 
  ggtitle('Power Forward Salary and Total Rebounds Correlation') +
  geom_text(aes(x = 1.5e+07, y = 500, 
                label = corr_eqn(power_forward$TRB,power_forward$Salary)),
            parse = TRUE, colour = "#ff0000")

#### 5. SHOOTING GUARD Correlation plot

shooting_guard <- final_roster[final_roster$Pos == 'SG', ]
ggplot(shooting_guard, aes(x = shooting_guard$Salary, 
                           y = shooting_guard$eFG.)) +
  geom_point() +
  geom_smooth(method = 'lm') +
  labs(x = 'Salary', y = 'Field Goal Percentage') +
  scale_x_continuous(labels = dollar) + 
  ggtitle('Shooting Guard Salary and Field Goal Percentage Correlation') +
  geom_text(aes(x = 1.3e+07, y = 0.4, 
                label = corr_eqn(shooting_guard$eFG., shooting_guard$Salary)),
            parse = TRUE, colour = "#ff0000")


