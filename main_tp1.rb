# Main file executing the function to solve the variance
# Include csv library to read file
require 'csv'
require_relative 'functions'

CSV_NAME = "data/data_tp1.csv"
data_sample = []

# Retrieve data from csv
x = 0
CSV.foreach( CSV_NAME ) do |row|
    data_sample[x] = Integer( row[0] )
    x += 1
end

o = Functions.new( data_sample )

# STEP 1 : Set the average of the data sample
o.set_average()

# STEP 2 : Set the square of the difference of the distance of each data with the average
o.set_square_distance()

# STEP 3 : Set the sum of STEP 2
o.set_sum_square_distance()

# STEP 4 : Set the variance
o.set_variance()

# STEP 5 : Set the deviation
o.set_deviation()

# STEP 6 : Display the average, the variance and the deviation
puts ""
puts ""
puts "TP01 - Calcul de la variance"
puts ""
puts ""
puts "Here is the different calculus made on the data sample"
puts "------------------------------------------------------"
puts ""
puts "The average : #{ o.get_average() }"
puts "The variance : #{ o.get_variance() }"
puts "The deviation : #{ o.get_deviation() }"
puts ""
puts ""