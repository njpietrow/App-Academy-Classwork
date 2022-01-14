def childs_weath_at_retirement(my_age)
  age_of_retirement = 65
  childs_age = my_age / 2
  years_till_retirement = age_of_retirement - childs_age
  amount_in_bank = childs_age**2
  amount_in_bank * years_till_retirement
end

# You know the algorithm involves these steps in some order:

# Calculate how much money they'll have by multiplying by the number of years they have left until retirement.
# Estimate your child's current bank account by squaring their age.
# Estimate your child's age by dividing your age by two.
# Calculate how many years your child has left until they retire at age 65

p childs_weath_at_retirement(30) #11250
p childs_weath_at_retirement(50) #25000