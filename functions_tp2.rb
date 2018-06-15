require 'csv'

class Functions  
    def initialize( csv_name )  
      # Instance variables  
      @datas = []   
      @average = 0
      @square_distance = []
      @sum_distance = 0
      @variance = 0
      @deviation = 0

      x = 0
      CSV.foreach( csv_name ) do |row|
          if( x > 0 )

             if(! row[1].nil? )
              fullstring = row[0].concat(".").concat( row[1] )
             else
              fullstring = row[0]
             end 
   
             @datas[x] = fullstring.split(";").map(&:to_f)
             # puts "#{ x }  : #{ @datas[x] } "
          end
          x += 1
      end

      @data_count = @datas.count
    end  
    
end  