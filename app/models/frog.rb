class Frog < ActiveRecord::Base
  
  validates_inclusion_of :num_leaves, :in => 1..100000
  validates_inclusion_of :river_width, :in => 1..100000

end
