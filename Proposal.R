

state.df <- read.csv(file ='tstate.csv')

death.df <- read.csv(file = 'deaths.csv')

head(state.df)
head(death.df)

class(state.df)
length(state.df)


colnames(state.df)
colnames(death.df)


state.df$TotalTests <- state.df[-which(is.na(state.df$TotalTests)), ]
state.df$TotalTests

cor.test(state.df$TotalDeaths, state.df$TotalTests, method="pearson")
#numerical data
#in terms of numbers (quanitative data)
#correlation coefficent shows linear relationship between both on a linear regression plot
#strong positive correlation (may or may not be causation between the variables)
#pvalue less than 0.05, reject the null hypothesis and accept altnerative hypothesis
    #the sample data is influenced by some non-random cause
    #there is a linear relation between Total Tests and Total Deaths
    #relationship exists
    

chisq.test(state.df$TotalDeaths, state.df$TotalTests, correct = FALSE)
#categorical data
#grouping made according to the data characteristics and similarities (qualitative data)
#using quantitative data for this so chi square test is not accurate or helpful

plot(state.df$TotalTests, state.df$TotalDeaths, xlab= "Total Number of Deaths", 
     ylab="Total Number of Tests", main=" Number of Covid Tests v Deaths")
abline(lm(formula = state.df$TotalDeaths ~ state.df$TotalTests))
#shows statistical relationship, but not a deterministic one
state.summary <- lm(formula = state.df$TotalDeaths ~ state.df$TotalTests)
summary(state.summary)


cor.test(death.df$NewDeaths, death.df$DailyCountofPeopleFullyVaccinated, method="pearson")
#slight negative correlation
#pvalue less than 0.05, reject the null hypothesis and accept altnerative hypothesis
#the sample data is influenced by some non-random cause
#there is a linear relation between 
#relationship exists



chisq.test(death.df$NewDeaths, death.df$DailyCountofPeopleFullyVaccinated, correct=FALSE)
#again, applying a function for qualitative data to quantitative data, not useful

plot(death.df$NewDeaths, death.df$DailyCountofPeopleFullyVaccinated,
     xlab="Numbers of People Fully Vaccinated per Day", 
     ylab="Number of Deaths per Day", 
     main="Number of Covid Deaths and Vaccinations per Day")
abline(lm(formula= death.df$DailyCountofPeopleFullyVaccinated ~ death.df$NewDeaths))

death.summary <- lm(formula= death.df$DailyCountofPeopleFullyVaccinated ~ death.df$NewDeaths)
summary(death.summary)




