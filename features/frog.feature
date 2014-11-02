Feature: Frog features
	In order to ensure my frog jumps as expected
	As a developer
	I want to test my random number generation for the falling leaves
	I want to test the method returns the values expected
	I want to test the worst case scenario speed requirement of the method
	I want to test the worst case scenario space requirement of the method 

	Scenario: Random number generation test
		Given a frog
		And the frog's random number generator generates a value
		Then the value should be an integer between 1 and 100000
		
	Scenario Outline: Method returning expected values
		Given a frog
		And the number of leaves is <leaves>
		And the leaves fall in pattern is <pattern>
		Then the earliest the frog can get across the river is in <min> minutes
		
		Examples:
		|leaves	|pattern			|min|
		|5		|1,3,1,4,2,3,5,4	|6	|
		|2		|2,1				|2	|
		
		
		
		