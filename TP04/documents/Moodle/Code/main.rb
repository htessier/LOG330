# Main file executing the function to solve the variance
# Include csv library to read file
require_relative 'functions'

datafile = "data/data.csv"

o = Functions.new( true )

nombreCours = o.readFile( datafile )

puts ""
puts "Nombre de cours : #{ nombreCours } "
puts ""

courseNumber = 1

while courseNumber <= nombreCours do

    correlation = 0

    puts "Correlation du Cours #{ courseNumber } par rapport a l'intra"
    puts "--------------------------------------------------"
        correlation = o.getCorrelationByCourse( courseNumber )
    puts ""
    puts ""

    courseNumber += 1
end    