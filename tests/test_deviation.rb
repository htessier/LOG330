require_relative 'functions'
require "test/unit"

class Test_Deviation < Test::Unit::TestCase  
    def setup
        @deviation = 0 
        o = Functions.new( true )
        o.set_deviation()
        @deviation = o.get_deviation()
      end
  
      def test_deviation_lower_bound        
          assert_equal( true, @deviation > -100000, "Deviation lower bound failed.")
      end
      
      def test_deviation_upper_bound
          assert_equal( true, @deviation < 100000, "Deviation upper bound failed.")
      end
  
      def test_deviation_invalid_bound
          assert_equal( true, @deviation.is_a?(Float), "Deviation invalid bound failed")
      end
end  