Note: Read report for full analysis

## To create a regression model to predict medexpense. ##
The data set contains data of a random sample of 10,089 people on how much they paid in out-of-pocket medical expenses in one year (medexpense).

The Dependent Variable - medexpense is right skewed and is not normally distributed. Therefore, is not suitable for OLS regression model. Log transformation can be applied to make the variable closer to normal.

## Best three Regression Models 
lm1 =lm(logmedexpense~healthins+age+female+income+illnesses+lowincome+educyr +private+verygood+good+fair +poor+poverty+midincome+msa+prioritylist,hi)
lm2 = lm(logmedexpense~healthins+age+female+illnesses+lowincome+educyr +private+verygood+good+fair+poor+poverty+midincome+msa+prioritylist,hi)
lm3 <- lmrob(logmedexpense~healthins+age+female+illnesses+lowincome+educyr +private+verygood+good+fair+poor+poverty+midincome+msa+prioritylist, data=hi)

## Insights ##
# Do people with health insurance have higher or lower medical expense than people without health insurance, when other variables are controlled? By how much? Why do you think this happens?
People with health insurance have higher medical expense. There is an increase of 8.3% in medical expense for people with health insurance. It may be because people with health insurance took health insurance because they are more health conscious. They may visit hospital more as they can dependent on health insurance. It could also be people without health insurance do not take tests ordered after visit as they are expensive.
# Do people with private insurance pay more or less than people with public insurance? By how much?
People with private insurance pay less than public insurance by 1%.
# Do people with more illnesses have higher or lower medical expense than people with less illnesses? By how much?
People with more illnesses have higher medical expense than people with less illnesses by 33%.
# Do males have higher medical expense than females? By how much?
Males have lower medical expense than females by 6.1%.
# Do older people have higher medical expense than younger people? By how much?
Older people have higher medical expense than relatively younger people by .5%. However, it has to be remembered that the age of all patients is between 65 and 91, so demographically they are old.
# Do minority groups (Blacks/Hispanics) have higher or lower medical expenses than the non-minority population? By how much?
Minority groups have lower medical expenses than non-minority population, blacks have 17.4% less and Hispanics 15.7% less.
# How do people’s income level relate to their medical expense, when controlled for other factors? By how much?
People in poverty tend to spend 3.9% less, people with low income spend .8% less and people with middle income spend 3% more.




