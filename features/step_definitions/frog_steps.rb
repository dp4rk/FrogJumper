Given(/^a frog$/) do
  @frog = Frog.new(:river_width => rand(1..100000)
end

Then(/^the frog's random value should be an integer$/) do
  width = @frog.river_width.is_a? Integer
  expect(width).to eq(true) #If either are false, this test fails.
end

Then(/^the frog's random value should be between (\d+) and (\d+)$/) do |min, max|
  expect(@frog.river_width).to be_between(min.to_i, max.to_i).exclusive
end

Given(/^the river width is (\d+)$/) do |width|
  @frog.river_width = width.to_i 
end

#This is a poorly made step - any pattern longer than 9 leaves will not work with this formula.  If separated by commas, this regular expression fails,
#And if a regular expression is written to incorporate commas, it will only take the last number (EOL issue) or the step will have to
#be customized for the amount of leaves in the pattern, and redundant steps will occur.
Given(/^the leaves fall in pattern (\d+)$/) do |pattern|
  @pattern = pattern.split('').map{|e| e.to_i} #Takes an integer and splits it using string functions into an array of single digits
end

Then(/^the earliest the frog can get across the river is in (\d+) minutes$/) do |mins|
  expect(@frog.time_to_cross_river(@pattern)).to eq(mins.to_i)
end

#Fail case - should return -1 if frog cannot cross for whatever reason
Then(/^the earliest the frog can get across the river is in -(\d+) minutes$/) do |mins|
  expect(@frog.time_to_cross_river(@pattern)).to eq(mins.to_i * -1)
end