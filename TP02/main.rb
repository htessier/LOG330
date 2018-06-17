# Main file executing the function to solve the variance
# Include csv library to read file
require_relative 'functions'

testing = false

o = Functions.new( testing )

o.set_sum_X_x_Y()

o.set_sum_X()

o.set_sum_Y()

o.set_numerator()

o.set_sum_x_square()

o.set_sum_square_x()

o.set_sum_y_square()

o.set_sum_square_y()

o.set_denominator()

o.set_correlation()

o.set_correlation_square()

puts ""
puts ""
puts "TP2 : Calculer la correlation"
puts "------------------------------"
puts "Correlation : #{ o.get_correlation() }"
puts "Correlation au carre : #{ o.get_correlation_square() }"
puts ""
puts ""