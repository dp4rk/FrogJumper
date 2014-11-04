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

Given(/^the number of leaves is (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the leaves fall in pattern is (\d+),(\d+),(\d+),(\d+),(\d+),(\d+),(\d+),(\d+)$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8|
  pending # express the regexp above with the code you wish you had
end

Then(/^the earliest the frog can get across the river is in (\d+) minutes$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the leaves fall in pattern is (\d+),(\d+)$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^a frog jumping across the river$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the leaves do not fall in a favorable pattern$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the method should iterate an equal number of times as (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the length of the frog jump array should be equal or less than (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end