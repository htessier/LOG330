require 'csv'

class Functions  
    def initialize( display )  
      @datas = []
      @display = display
    end  

    def readFile( filename )

      file = File.join(File.dirname(__FILE__), filename)
      file_contents = CSV.read(file, col_sep: ";", encoding: "ISO8859-1")
      
      x = 0
      index = 0
      index_main = 0
      nombreCol = 0
      
      file_contents.each { |row| 

        if( x > 1  )
          y = 0
          data = []

          row.each{ |col|
            
            if( y == 0 )

              if (! col.nil? )
                data[0] = col     
              end 

            else

              if( nombreCol == 0 ) 
                nombreCol = row.count - 2
              end 

              data[ y ] = (col.gsub ",", ".").to_f              
            end 

            y += 1
          }

          @datas[index_main] = data
          index_main += 1
        end

        x += 1
      }

      return nombreCol
    end 

    def getCorrelationByCourse( courseNumber )

      nbStudent = 0
      indexCourse = 0
      dataCourseX = []
      dataCourseY = []

      @datas.each{ |student|
        name = student[0]

        dataCourseX[ nbStudent ] = student[ courseNumber ]
        dataCourseY[ nbStudent ] = student[ -1 ]
        nbStudent += 1
      }

      sum_xy = setSumXxY( dataCourseX, dataCourseY )

      sum_x = setSum( dataCourseX )

      sum_y = setSum( dataCourseY )

      numerator = setNumerator( nbStudent, sum_xy, sum_x, sum_y )

      sum_x_square = setSumZSquare( dataCourseX )

      sum_square_x = setSumSquareZ( dataCourseX )

      sum_y_square = setSumZSquare( dataCourseY )

      sum_square_y = setSumSquareZ( dataCourseY )
      
      denominator = setDenominator( nbStudent, sum_x_square, sum_square_x, sum_y_square, sum_square_y )
      
      correlation = setCorrelation( numerator, denominator )
     
      correlation_square = setCorrelationSquare( correlation )

      interpretation = getInterpretation( correlation )

      if( @display )
        puts "Set Sum X x Y : #{ sum_xy }"
        puts "" 
        puts "Set Sum X : #{ sum_x }"
        puts "" 
        puts "Set Sum Y : #{ sum_y }"
        puts "" 
        puts "Numerator : #{ numerator }"
        puts "" 
        puts "Sum X Square : #{ sum_x_square }"
        puts ""
        puts "Sum Square X: #{ sum_square_x }"
        puts ""
        puts "Sum Y Square : #{ sum_y_square }"
        puts "" 
        puts "Sum Square Y: #{ sum_square_y }"
        puts "" 
        puts "Denominator : #{ denominator }"
        puts ""
        puts "Correlation : #{ correlation }"
        puts ""
        puts "Correlation Square : #{ correlation_square }"
        puts ""
        puts "Interpretation : #{ interpretation }"
        puts ""
      end 

      return correlation
    end if

    def setSumXxY( datasX, datasY )
      sum = 0
      index = 0

      datasX.each do |dataX|
          sum += dataX * datasY[ index ]
          
          index += 1
      end  

      return sum
    end

    def setSum( datas )
      sum = 0

      datas.each do |data|
        if(! data.nil?)
          sum += data
        end
      end  
      
      return sum
    end  

    def setNumerator( dataCount, sum_xy, sum_x, sum_y)
      return  (dataCount * sum_xy) - ( sum_x * sum_y )
    end   

    def setSumZSquare( datas)
      sum = 0

      datas.each do |data|
        if(! data.nil?)
          sum += (data * data)
        end
      end  

      return sum
    end 

    def setSumSquareZ( datas )
      sum = 0

      datas.each do |data|
        if(! data.nil?)
          sum += data
        end
      end  

     return (sum * sum)
    end 

    def setDenominator( nbStudent, sum_x_square, sum_square_x, sum_y_square, sum_square_y)
      return Math.sqrt( ( ( nbStudent *  sum_x_square ) - sum_square_x ) * ( ( nbStudent * sum_y_square ) - sum_square_y ) )
    end

    def setCorrelation( numerator, denominator ) 
      correlaiton = 0
      correlation = (numerator / denominator)

      if( correlation < 0 )
        correlation = correlation * (-1)
      end 

      return (correlation).round(8)
    end 

    def setCorrelationSquare( correlation )
      return (correlation * correlation).round(8)
    end

    def getInterpretation( correlation )
      output = ""

      case 
      when correlation >= 0 && correlation < 0.2
        output = "Nulle a Faible"
      when correlation >= 0.2 && correlation < 0.4
        output = "Faible a Moyenne"
      when correlation >= 0.4 && correlation < 0.7
        output = "Moyenne a Forte"
      when correlation >= 0.7 && correlation < 0.9
        output = "Forte a Tres forte"
      when correlation >= 0.9 && correlation <= 1
        output = "Tres forte a Parfaite"  
      else
        output = "Erreur d'interpretation"  
      end

      return output
    end 
end  