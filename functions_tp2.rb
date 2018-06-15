require 'csv'

class Functions  
    def initialize( csv_name )  
      # Instance variables  
      @datas = []   
      @sum_X_x_Y = 0
      @sum_X = 0
      @sum_Y = 0
      @numerator = 0

      @sum_X_square = 0
      @sum_square_X = 0
      @sum_Y_square = 0
      @sum_square_Y = 0
      @denominator = 0

      @correlation = 0

      x = 0
      CSV.foreach( csv_name ) do |row|
          if( x > 0 )

             if(! row[1].nil? )
              fullstring = row[0].concat(".").concat( row[1] )
             else
              fullstring = row[0]
             end 
   
             @datas[x-1] = fullstring.split(";").map(&:to_f)
          end
          x += 1
      end

      @data_count = @datas.count
    end  

    def set_sum_X_x_Y
      sum = 0

      @datas.each do |data|
        sum += data[0] * data[1]
      end  

      @sum_X_x_Y = sum
      
    end

    def set_sum_X
      sum = 0

      @datas.each do |data|
        sum += data[0] 
      end  
      
      @sum_X = sum
    end  

    def set_sum_Y
      sum = 0

      @datas.each do |data|
        sum += data[1] 
      end  

      @sum_Y = sum
    end  

    def set_numerator
      @numerator =  @data_count * @sum_X_x_Y - ( @sum_X * @sum_Y )
    end   

    def set_sum_x_square
      sum = 0

      @datas.each do |data|
        sum += data[0] * data[0]
      end  

      @sum_X_square = sum
    end 

    def set_sum_square_x
      sum = 0

      @datas.each do |data|
        sum += data[0]
      end  

      @sum_square_X = sum * sum 
    end 

    def set_sum_y_square
      sum = 0

      @datas.each do |data|
        sum += data[1] * data[1]
      end  

      @sum_Y_square = sum
    end 

    def set_sum_square_y
      sum = 0

      @datas.each do |data|
        sum += data[1]
      end  

      @sum_square_Y = sum * sum
    end 

    def set_denominator
      @denominator = Math.sqrt( ( ( @data_count *  @sum_X_square ) - @sum_square_X ) * ( ( @data_count * @sum_Y_square ) - @sum_square_Y ) )
    end

    def set_correlation 
      @correlation = @numerator / @denominator
    end 

    def set_correlation_square
      @correlation_square = @correlation * @correlation
    end

    def get_correlation
      return @correlation
    end 

    def get_correlation_square
      return @correlation_square
    end
end  