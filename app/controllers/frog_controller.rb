class FrogController < ApplicationController
  def new
    @frog = Frog.new
    
    if params[:pattern]
      @pattern = params[:pattern]
    
    elsif params[:leaves]
      @pattern = @frog.generate_crossing_pattern(params[:leaves].to_i)
    end #endif
      
  end #end new
  
end