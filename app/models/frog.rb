class Frog < ActiveRecord::Base
  
  #This is a required value since the frog needs to know how many places the leaves can fall to cross the river.  This is a very calculating frog.
  validates_inclusion_of :river_width, :in => 1..100000 #This is the number of locations that leaves need to fall.  >=1 leaf per location is the success criteria of the time function

  def time_to_cross_river(pattern)
    #If the pattern submitted is only 1 integer, it won't be an array and can't be dealt with like an array.
    if pattern.is_a? Integer
      
      #If the width is 1 and the pattern is also 1, then the frog crosses immediately.
      if pattern == river_width
        return 0
      else
        return -1
      end #endif
    
    elsif pattern.nil?
      return -1
    else
    
      if pattern.length < river_width
        return -1 #It can't cross the river if there are fewer leaves than the width
      end
      
      jumps_so_far = Array.new #This is how many jumps the frog has taken
  
      pattern.each_with_index do |leaf, i|
        unless ((jumps_so_far.include? leaf) || (leaf.to_i > self.river_width)) #If a leaf falls in a position outside of the river, it doesn't count
          jumps_so_far << leaf
  
          if jumps_so_far.length == river_width
            return i #If the frog has crossed the river, return the index of the pattern array - aka time it took to cross
          end #endif
        end #endunless
        
      end #endeach
      return -1 #If the frog fails to cross, return -1
    end #endif
  end #enddef
  
  #Generates the crossing pattern if it isn't given
  def generate_crossing_pattern(number_of_leaves)
    pattern = Array.new
    
    (1..number_of_leaves).each do |leaf|
      pattern << 1 + rand(self.river_width)
    end #end loop
    
    return pattern
  end #end generate_crossing_pattern(int)
  
  #Weeds out the bad patterns from the good. Ignores characters, only takes integers
  def pattern_splitter(input)
    pattern = Array.new
    
    if (input.include? ',') #if the string is comma separated
      #Non digit characters .to_i = 0
      pattern = input.split(',').map{|e| e.to_i} #Split on the comma and put it into an int array.
      output = Array.new
      
      pattern.each do |p|
        output << p if p > 0 #Skip the non-digit characters
      end
      
      #If it was a comma separated array of word characters
      if output.empty?
        return nil
      else
        return output
      end
            
    else #else it isn't comma separated
      if input.to_i > 0
        pattern = input.split('').map{|e| e.to_i} #Ignores the string characters
    
      else
        return nil #Returns a blank if no integers are in the input
      end #endif
    end #endif
  end #end pattern_splitter(string)
end #endmodel
