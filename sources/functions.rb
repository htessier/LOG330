require 'csv'

class Functions  
    def initialize  
      # Instance variables  
      @datas = []   
      @average = 0
      @square_distance = []
      @sum_distance = 0
      @variance = 0
      @deviation = 0

      # Loading the data from csv
      file = "../data/data.csv"

      x = 0
      CSV.foreach( file ) do |row|
          if( x > 0 )
              @datas[x] = Integer( row[0] )
          end
          x += 1
      end

      @data_count = @datas.count
    end  
    
    def set_average  
      if @datas

        sum = 0
        @datas.each do |data|
          if ! data.nil?
            sum += data
          end
        end  
       
        @average = ( sum.to_f / @data_count ).round(3) ;
      end  
    end  

    def set_square_distance

      x = 0

      if @average 
        @datas.each do |data|
          distance = (data - @average).round(5)
          @square_distance[x] = ( distance * distance )
          x += 1
        end  
      end

    end

    def set_sum_square_distance

      if @square_distance 
        @square_distance.each do |distance|
           @sum_distance += distance
        end 
      end 

    end 

    def set_variance

      if @sum_distance 

        @variance = ( ( 1 / ( @data_count - 1 ).to_f ) * @sum_distance ).round(4)

      end

    end

    def set_deviation

      if @variance 
        @deviation = Math.sqrt( @variance ).round(2)
      end

    end

    def get_average
      return @average 
    end 

    def get_variance 
      return @variance 
    end 

    def get_deviation 
      return @deviation
    end
end  