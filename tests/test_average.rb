require_relative 'sources/functions'
require "test/unit"

class Test_Average < Test::Unit::TestCase  

    def setup
      @average = 0
      o = Functions.new()
      o.set_average()
      @average = o.get_average()
    end

    def test_average_lower_bound        
        assert_equal( true, @average > -100000, "Average lower bound failed.")
    end
    
    def test_average_upper_bound
        assert_equal( true, @average < 100000, "Average upper bound failed.")
    end

    def test_average_invalid_bound
        assert_equal( true, @average.is_a?(Float), "Average invalid bound failed")
    end
    
end  