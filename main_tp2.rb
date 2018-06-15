# Main file executing the function to solve the variance
# Include csv library to read file
require 'csv'
require_relative 'functions_tp2'

csv = "data/data_tp2.csv"

o = Functions.new( csv )

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