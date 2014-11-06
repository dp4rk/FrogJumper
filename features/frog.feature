Feature: Frog features
	In order to ensure my frog jumps as expected
	As a developer
	I want to test my random number generation for the falling leaves
	I want to test the method returns the values expected
	I want to test the worst case scenario speed requirement of the method
	I want to test the worst case scenario space requirement of the method 

	Scenario: Random number generation test
		Given a frog
		Then the frog's random value should be an integer
		And the frog's random value should be greater than or equal to 1
		And the frog's random value should be less than or equal to 100000
		
	Scenario Outline: Method returning expected values
		Given a frog
		And the number of leaves is <leaves>
		And the leaves fall in pattern <pattern>
		Then the earliest the frog can get across the river is in <min> minutes
		
		Examples:
		|leaves	|pattern	|min|
		|5		|13142354	|6	|
		|2		|21			|2	|
		
	Scenario Outline: Checking the worst case scenario is still within O(N) of time and O(X) of space
		Given a frog jumping across the river
		And the number of leaves is <leaves>
		And the leaves do not fall in a favorable pattern
		Then the method should iterate an equal number of times as <leaves>
		And the length of the frog jump array should be equal or less than <leaves>
		
		Examples:
		|leaves	|
		|2		|
		|5		|
		|100000	|
		
		