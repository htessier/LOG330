require_relative '../functions'
require_relative '../reader'
require "test/unit"

class Test_Correlation < Test::Unit::TestCase  

    def setup
      @file = "tests/data_tests.csv"  
      @inf = 0
      @sup = 0
      setIntervalle()
    end

    def testIntervalleLowerBound        
        assert_equal( true, @inf >= 0, "Intervalle lower bound failed.")
    end
    
    def testIntervalleUpperBound
        assert_equal( true, @sup <= 1, "Intervalle upper bound failed.")
    end

    def testIntervalleInfInvalidBound
        assert_equal( false, @inf.is_a?(String), "Intervalle invalid bound failed")
    end

    def testIntervalleSupInvalidBound
        assert_equal( false, @sup.is_a?(String), "Intervalle invalid bound failed")
    end

    def testIntervalleNegativeBound
        assert_equal( false, @inf < 0, "Intervalle negative value failed")
    end

    def testIntervalleNil
        assert_equal( false, @inf.nil?, "Intervalle negative value failed")
    end

    def setIntervalle()
        rd = DataReaderFunctions.new()
        cf = CalculusFunctions.new( false )       
        
        rd.readFile( @file )
        dataY = rd.extractY()
        dataX = rd.extractX()
        
        yreg = cf.calculerRegression()
        ecart = cf.calculerEcartType( dataY, yreg )
        moyenX = cf.calculerXmoyen( dataX )
        
        # intervalle a 70 %
        law = cf.getStudentLawByLevel( 70 )
        intervalle70 = cf.calculerIntervalle( law, ecart, moyenX, dataX )
        @inf = cf.calculerBorneInf( yreg, intervalle70 )
        @sup = cf.calculerBorneSup( yreg, intervalle70 )

    end 
end  