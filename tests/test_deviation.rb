require 'csv'
require_relative '../functions'

class Test_Deviation  
    def initialize()  
        # Instance variables
        @deviation = 0  
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
        o.set_deviation()

        @deviation = o.get_deviation()
    end  

    def deviation_lower_bound()
        if @deviation < -1000000000 
            puts "deviation_lower_bound() : Fail"
        else
            puts "deviation_lower_bound() : Pass"
        end 
    end
    
    def deviation_upper_bound()
        if @deviation > 1000000000
            puts "deviation_upper_bound() : Fail"
        else
            puts "deviation_upper_bound() : Pass"
        end
    end

    def deviation_invalid_bound()
        if @deviation.instance_of?(String)
            puts "deviation_invalid_bound() : Fail"
        else
            puts "deviation_invalid_bound() : Pass"
        end 
    end
    
end  

test = Test_Deviation.new()

# Test lower bound
test.deviation_lower_bound()
puts ""
puts ""
# Test upper bound
test.deviation_upper_bound()
puts ""
puts ""
# Test invalid bound
test.deviation_invalid_bound()
puts "" 
puts ""