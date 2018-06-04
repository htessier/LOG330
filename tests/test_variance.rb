require 'csv'
require_relative '../functions'

class Test_Variance  
    def initialize()  
        # Instance variables
        @variance = 0  
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
        o.set_variance()

        @variance = o.get_variance()
    end  

    def variance_lower_bound()
        if @variance < -1000000000 
            puts "variance_lower_bound() : Fail"
        else
            puts "variance_lower_bound() : Pass"
        end 
    end
    
    def variance_upper_bound()
        if @variance > 1000000000
            puts "variance_upper_bound() : Fail"
        else
            puts "variance_upper_bound() : Pass"
        end
    end

    def variance_invalid_bound()
        if @variance.instance_of?(String)
            puts "variance_invalid_bound() : Fail"
        else
            puts "variance_invalid_bound() : Pass"
        end 
    end
    
end  

test = Test_Variance.new()

# Test lower bound
test.variance_lower_bound()
puts ""
puts ""
# Test upper bound
test.variance_upper_bound()
puts ""
puts ""
# Test invalid bound
test.variance_invalid_bound()
puts "" 
puts ""