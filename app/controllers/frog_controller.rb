class FrogController < ApplicationController
  def new
    @frog = Frog.new
    
    if params[:pattern]
      @pattern = params[:pattern]
    
    elsif params[:leaves]
      @pattern = generate_crossing_pattern(params[:leaves].to_i)
    end #endif
      
  end #end new
  
  #Generates the crossing pattern if it isn't given
  def generate_crossing_pattern(leaves)
    pattern = Array.new
    
    (1..leaves).each do |leaf|
      pattern << 1 + rand(@frog.river_width)
    end #end loop
    
    return pattern
  end #end generate_crossing_pattern(int)
  
  

end
