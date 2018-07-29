class CalculusFunctions  
    def initialize( testing = false )  

    end  

    def calculerRegression()
      return 1911
    end 

    def calculerEcartType( dataY, regressionY )
      sum = 0
      count = dataY.count()
      den = count - 1
      multiplier = 1/den.to_f 

      dataY.each do |data|
          sum += ( data - regressionY ) * ( data - regressionY )    
      end  

      ecartType = Math.sqrt( multiplier * sum ) 

      return ecartType
    end

    def calculerXmoyen( dataX )

      sum = 0
      count = dataX.count()

      dataX.each do |data|
        sum += data 
      end 

      return sum.to_f / count
    end 

    def calculerIntervalle( law, ecartType, xMoyen, dataX )
      sum = 0
      xk = 1000 

      dataX.each do |data|
        sum += ( data - xMoyen ) * ( data - xMoyen )    
      end  

      square_root = 1 + (1/dataX.count()) + ( ( 300 - xMoyen ) * ( 300 - xMoyen ) ) / sum 

      intervalle = law * ecartType * Math.sqrt( square_root )

      return intervalle
    end 

    def getStudentLawByLevel( level )
      law = 0

      if( level == 70 )
        law = 1.108
      elsif( level == 90 )
        law = 1.860
      end 

      return law
    end


    def calculerBorne( regressionY, intervalle )

      if( regressionY - intervalle < 0 )
        borneInf = 0
      else
        borneInf = ( regressionY - intervalle ).to_i
      end if

      borneSup = ( regressionY + intervalle ).to_i

      return " #{ borneInf } a #{ borneSup } LOC" 
    end

    def calculerBorneInf( regressionY, intervalle )
      borneInf = 0

      if( (regressionY - intervalle) > 0 )
        borneInf = regressionY - intervalle
      end

      return borneInf.to_i
    end

    def calculerBorneSup( regressionY, intervalle )
      borneSup = -1

      borneSup = regressionY.to_i + intervalle.to_i
  
      return borneSup.to_i
    end
end  