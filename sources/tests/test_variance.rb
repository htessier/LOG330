require_relative '../functions'
require "test/unit"

class Test_Variance  
    def setup
        @variance = 0
        o = Functions.new()
        o.set_variance()
        @variance = o.get_variance()
      end
  
      def test_variance_lower_bound        
          assert_equal( true, @variance > -100000, "Variance lower bound failed.")
      end
      
      def test_variance_upper_bound
          assert_equal( true, @variance < 100000, "Variance upper bound failed.")
      end
  
      def test_variance_invalid_bound
          assert_equal( true, @variance.is_a?(Float), "Variance invalid bound failed")
      end
end  