require_relative '../functions'
require "test/unit"

class Test_Correlation_Square < Test::Unit::TestCase  
    def setup
        @correlation_square = 0
        @correlation_square = get_correlation_square()
      end
  
      def test_correlation_square_lower_bound        
          assert_equal( true, @correlation_square >= 0, "Correlation square lower bound failed.")
      end
      
      def test_correlation_square_upper_bound
          assert_equal( true, @correlation_square <= 1, "Correlation square upper bound failed.")
      end
  
      def test_correlation_square_invalid_bound
          assert_equal( false, @correlation_square.is_a?(String), "Correlation square invalid bound failed")
      end
  
      def test_correlation_square_negative_bound
          assert_equal( false, @correlation_square < 0, "Correlation square negative value failed")
      end
  
      def test_correlation_square_nil
          assert_equal( false, @correlation_square.nil?, "Correlation square negative value failed")
      end
  
      def get_correlation_square
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
        o.set_correlation_square()
        
        return o.get_correlation_square()
      end 
end  