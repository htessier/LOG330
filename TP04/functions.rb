require 'csv'

class Functions  
    def initialize()  
      @datas = []
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

              #if( nombreCol == 0 ) 
              #  nombreCol = col.count - 2
              #end 

              data[ y ] = (col.gsub ",", ".").to_f              
            end 

            y += 1
          }

          @datas[index_main] = data
          index_main += 1
        end

        x += 1
      }

      return 6
    end 

    def getCorrelationByCourse( courseNumber )
      nbStudent = 0
      indexCourse = 0
      dataCourseX = []
      dataCourseY = []

      @datas.each{ |student|
        name = student[0]

        dataCourseX[ nbStudent ] = student[ courseNumber ]
        dataCourseY[ nbStudent ] = student[ 7 ]
        nbStudent += 1
      }

      sum_xy = set_sum_X_x_Y( dataCourseX, dataCourseY )
      puts "Set Sum X x Y : #{ sum_xy }"
      puts "" 

      sum_x = set_sum( dataCourseX )
      puts "Set Sum X : #{ sum_x }"
      puts "" 

      sum_y = set_sum( dataCourseY )
      puts "Set Sum Y : #{ sum_y }"
      puts "" 

      numerator = set_numerator( nbStudent, sum_xy, sum_x, sum_y )
      puts "Numerator : #{ numerator }"
      puts "" 

      sum_x_square = set_sum_z_square( dataCourseX )
      puts "Sum X Square : #{ sum_x_square }"
      puts "" 

      sum_square_x = set_sum_square_z( dataCourseX )
      puts "Sum Square X: #{ sum_square_x }"
      puts "" 

      sum_y_square = set_sum_z_square( dataCourseY )
      puts "Sum Y Square : #{ sum_y_square }"
      puts "" 

      sum_square_y = set_sum_square_z( dataCourseY )
      puts "Sum Square Y: #{ sum_square_y }"
      puts "" 

      denominator = set_denominator( nbStudent, sum_x_square, sum_square_x, sum_y_square, sum_square_y )
      puts "Denominator : #{ denominator }"
      puts ""

      correlation = set_correlation( numerator, denominator )
      puts "Correlation : #{ correlation }"
      puts ""

      correlation_square = set_correlation_square( correlation )
      puts "Correlation Square : #{ correlation_square }"
      puts ""

      interpretation = get_interpretation( correlation )
      puts "Interpretation : #{ interpretation }"
      puts ""
    end if

    def set_sum_X_x_Y( datasX, datasY )
      sum = 0
      index = 0

      datasX.each do |dataX|
          sum += dataX * datasY[ index ]
          
          index += 1
      end  

      return sum
    end

    def set_sum( datas )
      sum = 0

      datas.each do |data|
        if(! data.nil?)
          sum += data
        end
      end  
      
      return sum
    end  

    def set_numerator( dataCount, sum_xy, sum_x, sum_y)
      return  (dataCount * sum_xy) - ( sum_x * sum_y )
    end   

    def set_sum_z_square( datas)
      sum = 0

      datas.each do |data|
        if(! data.nil?)
          sum += (data * data)
        end
      end  

      return sum
    end 

    def set_sum_square_z( datas )
      sum = 0

      datas.each do |data|
        if(! data.nil?)
          sum += data
        end
      end  

     return (sum * sum)
    end 

    def set_denominator( nbStudent, sum_x_square, sum_square_x, sum_y_square, sum_square_y)
      return Math.sqrt( ( ( nbStudent *  sum_x_square ) - sum_square_x ) * ( ( nbStudent * sum_y_square ) - sum_square_y ) )
    end

    def set_correlation( numerator, denominator ) 
      return (numerator / denominator).round(8)
    end 

    def set_correlation_square( correlation )
      return (correlation * correlation).round(8)
    end

    def get_interpretation( correlation )
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