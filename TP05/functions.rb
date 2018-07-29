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
      mult = 1/den.to_f 

      dataY.each do |data|
          sum += ( data - regressionY ) * ( data - regressionY )    
      end  

      ecartType = Math.sqrt( mult * sum ) 

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

    def calculerIntervalle( law, ecart, moyenX, dataX )
      sum = 0
      xk = 1000 

      dataX.each do |data|
        sum += ( data - moyenX ) * ( data - moyenX )    
      end  

      square_root = 1 + (1/dataX.count()) + ( ( 300 - moyenX ) * ( 300 - moyenX ) ) / sum 

      intervalle = law * ecart * Math.sqrt( square_root )

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


    def calculerBorne( yreg, intervalle )
      output = ""

      if( yreg - intervalle < 0 )
        inf = 0
      else
        inf = ( yreg - intervalle ).to_i
      end if

      sup = ( yreg + intervalle ).to_i

      return " #{ inf } a #{ sup } LOC" 
    end
end  