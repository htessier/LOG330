require 'csv'

class DataReaderFunctions  
    def initialize( testing = false )  

      # Instance variables  
      @rawData = []   
      @dataX = []
      @dataY = []
      @count = 0

    end  

    def readFile( filename )

        file = File.join(File.dirname(__FILE__), filename )
        x = 0
        y = 0

        CSV.foreach( file ) do |row|
  
            if( x == 1 )
                @count = row[0]
            end

            if( x > 1 )
               
                @dataX[y] = row[0].to_f
                @dataY[y] = row[1].to_f

                y += 1
            end

            x += 1
        end
    end

    def extractX()
        return @dataX
    end 

    def extractY()
        return @dataY
    end 

end  