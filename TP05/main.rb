# Main file executing the function to solve the variance
# Include csv library to read file
require_relative 'functions'
require_relative 'reader'

testing = false
filename = "data/data.csv"


rd = DataReaderFunctions.new()
cf = CalculusFunctions.new( testing )


rd.readFile( filename )
dataY = rd.extractY()
dataX = rd.extractX()

yreg = cf.calculerRegression()
ecart = cf.calculerEcartType( dataY, yreg )
moyenX = cf.calculerXmoyen( dataX )

# intervalle a 70 %
law = cf.getStudentLawByLevel( 70 )
intervalle70 = cf.calculerIntervalle( law, ecart, moyenX, dataX )
loc70 = cf.calculerBorne( yreg, intervalle70 )

# intervalle a 90 %
law = cf.getStudentLawByLevel( 90 )
intervalle90 = cf.calculerIntervalle( law, ecart, moyenX, dataX )
loc90 = cf.calculerBorne( yreg, intervalle90 )

puts ""
puts "TP05 : Calculer l'intervalle"
puts "------------------------------"
puts "Intervalle 70 %, la taille du projet varie de : #{ loc70 }"
puts ""
puts "Intervalle 90 %, la taille du projet varie de : #{ loc90 }"

puts ""
puts ""