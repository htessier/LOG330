# Main file executing the function to solve the variance
# Include csv library to read file
require_relative 'functions'

datafile = "data/data.csv"

o = Functions.new()

nombreCours = o.readFile( datafile )
puts "Nombre de cours : #{ nombreCours } "
courseNumber = 1

while courseNumber <= nombreCours do

    puts "Correlation du Cours #{ courseNumber } par rapport a l'intra"
    puts "--------------------------------------------------"
        o.getCorrelationByCourse( courseNumber )
    puts ""
    puts ""

    courseNumber += 1
end    