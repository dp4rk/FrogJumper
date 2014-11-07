class FrogController < ApplicationController
  def new
    
    @frog = Frog.new

    #If all fields are left blank, just randomize it!
    if params[:width].blank? && params[:pattern].blank? && params[:leaves].blank?
      @frog.river_width = 1 + rand(100000)
      @pattern = @frog.generate_crossing_pattern(@frog.river_width)
    
    else
      #If only the width is blank, randomize it.  
      if params[:width].blank?
        @frog.river_width = 1 + rand(100000)
      
      else
        @frog.river_width = params[:width].to_i
      end
      
      #Use the river width to generate the crossing pattern if no pattern or leaf number has been entered
      if params[:pattern].blank? && params[:leaves].blank?
        @pattern = @frog.generate_crossing_pattern(@frog.river_width)
      
      #Else one of the two fields has been submitted
      else
        #If the pattern is blank, generate the crossing pattern on the number of leaves, N
        if params[:pattern].blank?
          @pattern = @frog.generate_crossing_pattern(params[:leaves].to_i)
        
        #If the pattern is not blank, use the pattern submitted
        else
          @pattern = params[:pattern].split(',').map{|e| e.to_i} #Splits the input pattern on commas and separates them into ints
        end
      end #endif
    end #endif
            
    @time = @frog.time_to_cross_river(@pattern) #This is the final function.  Input is an array of integers.
  end #end new
  
end#end frog_controller