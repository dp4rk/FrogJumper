class FrogController < ApplicationController
  def new
    
    @frog = Frog.new

    if params[:width]
      @frog.river_width = params[:width].to_i
    
    else
      @frog.river_width = 1 + rand(100000)
    end
        
    if params[:pattern]
      @pattern = params[:pattern].split(',').map{|e| e.to_i} #Splits the input pattern on commas and separates them into ints
    
    elsif params[:leaves]
      @pattern = @frog.generate_crossing_pattern(params[:leaves].to_i)
    end #endif
          
    @time = @frog.time_to_cross_river(@pattern)
  end #end new
  
end#end frog_controller