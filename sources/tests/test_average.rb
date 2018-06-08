require 'csv'
require_relative '../functions'

class Test_Average  
    def initialize()  
        # Instance variables
        @average = 0  
        file = "data/data.csv"
        data_sample = []

        # Retrieve data from csv
        x = 0
        CSV.foreach( file ) do |row|
            if( x > 0 )
                data_sample[x] = Integer( row[0] )
            end
            x += 1
        end

        o = Functions.new( data_sample )
        o.set_average()

        @average = o.get_average()
    end  

    def average_lower_bound()

        if @average < -1000000000 
            puts "Average_lower_bound() : Fail"
        else
            puts "Average_lower_bound() : Pass"
        end 
    end
    
    def average_upper_bound()
        if @average > 1000000000
            puts "Average_upper_bound() : Fail"
        else
            puts "Average_upper_bound() : Pass"
        end
    end

    def average_invalid_bound()
        if @average.instance_of?(String)
            puts "Average_invalid_bound() : Fail"
        else
            puts "Average_invalid_bound() : Pass"
        end 
    end
    
end  

test = Test_Average.new()

# Test lower bound
test.average_lower_bound()
puts ""
puts ""
# Test upper bound
test.average_upper_bound()
puts ""
puts ""
# Test invalid bound
test.average_invalid_bound()
puts "" 
puts ""