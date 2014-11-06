require 'pry'

Given(/^a frog$/) do
  @frog = Frog.new
end

Given(/^the frog's random number generator generates a value$/) do
  @frog.rand.empty?.should == false
end

Then(/^the frog's random value should be an integer$/) do
  @frog.rand.is_a?(Integer).should == true
end

Then(/^the frog's random value should be greater than or equal to (\d+)$/) do |min|
  @frog.rand.should >= min
end

Then(/^the frog's random value should be less than or equal to (\d+)$/) do |max|
  @frog.rand.should <= max
end

Given(/^the number of leaves is (\d+)$/) do |leaves|
  @frog.leaves = leaves 
end

#This is a poorly made step - any pattern longer than 9 leaves will not work with this formula.  If separated by commas, this regular expression fails,
#And if a regular expression is written to incorporate commas, it will only take the last number (EOL issue) or the step will have to
#be customized for the amount of leaves in the pattern, and redundant steps will occur.
Given(/^the leaves fall in pattern (\d+)$/) do |pattern|
  binding.pry #binding here to doublecheck if <pattern> is a string or an int
  @frog.pattern = pattern.to_s.split('').map{|e| e.to_i} #Takes an integer and splits it using string functions into an array of single digits
end

Then(/^the earliest the frog can get across the river is in (\d+) minutes$/) do |mins|
  @frog.time.should == mins
end

Given(/^a frog jumping across the river$/) do
  @frog = Frog.create!
end

Given(/^the leaves do not fall in a favorable pattern$/) do
  @frog.generate_bad_pattern
end

Then(/^the method should iterate an equal number of times as (\d+)$/) do |mins|
  @frog.time.should == mins
end

Then(/^the length of the frog jump array should be equal or less than (\d+)$/) do |jumps|
  @frog.steps.length.should <= jumps
end