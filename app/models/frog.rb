class Frog < ActiveRecord::Base
  
  #This value is only needed if the pattern of falling leaves needs to be generated
  #validates_inclusion_of :num_leaves, :in => 1..100000 
  
  #This is a required value since the frog needs to know how many places the leaves can fall to cross the river.  This is a very calculating frog.
  validates_inclusion_of :river_width, :in => 1..100000 #This is the number of locations that leaves need to fall.  >=1 leaf per location is the success criteria of the time function

  def time_to_cross_river(pattern)
    if pattern.length < river_width
      return -1 #It can't cross the river if there are fewer leaves than the width
    
    else
      jumps_so_far = Array.new #This is how many jumps the frog has taken
  
      pattern.each_with_index do |leaf, i|
  
        unless jumps_so_far.include? leaf
          jumps_so_far << leaf
  
          if jumps_so_far.length == river_width
            return i #If the frog has crossed the river, return the index of the pattern array - aka time it took to cross
          end #endif
        end #endunless
        
      end #endeach
      return -1 #If the frog fails to cross, return -1

    end #endif   
  end #enddef
  
end #endmodel
