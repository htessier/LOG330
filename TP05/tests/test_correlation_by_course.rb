require_relative '../functions'
require "test/unit"

class Test_Correlation < Test::Unit::TestCase  

    def setup
      @file = "tests/data_tests.csv"  
      @correlation = 0
      @correlation = getCorrelation()
    end

    def testCorrelationLowerBound        
        assert_equal( true, @correlation >= 0, "Correlation lower bound failed.")
    end
    
    def testCorrelationUpperBound
        assert_equal( true, @correlation <= 1, "Correlation upper bound failed.")
    end

    def testCorrelationInvalidBound
        assert_equal( false, @correlation.is_a?(String), "Correlation invalid bound failed")
    end

    def testCorrelationNegativeBound
        assert_equal( false, @correlation < 0, "Correlation negative value failed")
    end

    def testCorrelationNil
        assert_equal( false, @correlation.nil?, "Correlation negative value failed")
    end

    def getCorrelation
      o = Functions.new( false )
      
      nbCourse = o.readFile( @file )
      
      correlation = o.getCorrelationByCourse( nbCourse )
     
      return correlation
    end 
end  