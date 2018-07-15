require_relative '../functions'
require "test/unit"

class Test_Correlation < Test::Unit::TestCase  

    def setup
      @file = "tests/data_tests.csv"  
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
      o = Functions.new( false )
      
      nbCourse = o.readFile( @file )
      
      correlation = o.getCorrelationByCourse( nbCourse )
     
      return correlation
    end 
end  