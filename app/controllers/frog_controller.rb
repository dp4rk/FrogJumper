class FrogController < ApplicationController
  def new
    @frog = Frog.new
  end
  
  #Generates the crossing pattern if it isn't given
  def generate_crossing_pattern
    @pattern = Array.new
    @frog.num_leaves = leaves
    1..leaves.each do |leaf|
      @pattern << 1 + rand(@frog.river_width)
    end
    @pattern.save
  end
  
  

end
