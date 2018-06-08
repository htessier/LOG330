class Functions  
    def initialize( datasample)  
      # Instance variables  
      @datas = datasample  
      @data_count = datasample.count 
      @average = 0
      @square_distance = []
      @sum_distance = 0
      @variance = 0
      @deviation = 0
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