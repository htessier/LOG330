require_relative '../functions'
require "test/unit"

class Test_Correlation < Test::Unit::TestCase  

    def setup
      @correlation = 0
      @correlation = get_correlation()
    end

    def test_correlation_lower_bound        
        assert_equal( true, @correlation >= 0, "Correlation lower bound failed.")
    end
    
    def test_correlation_upper_bound
        assert_equal( true, @correlation <= 1, "Correlation upper bound failed.")
    end

    def test_correlation_invalid_bound
        assert_equal( false, @correlation.is_a?(String), "Correlation invalid bound failed")
    end

    def test_correlation_negative_bound
        assert_equal( false, @correlation < 0, "Correlation negative value failed")
    end

    def test_correlation_nil
        assert_equal( false, @correlation.nil?, "Correlation negative value failed")
    end

    def get_correlation
      o = Functions.new( true )
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
      
      return o.get_correlation()
    end 
end  