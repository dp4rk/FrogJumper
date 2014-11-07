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
		And the frog's random value should be between 1 and 100000
		
	Scenario Outline: Method returning expected values
		Given a frog
		And the river width is <width>
		And the leaves fall in pattern <pattern>
		Then the earliest the frog can get across the river is in <min> minutes
		
		Examples:
		|width	|pattern	|min|
		|5		|13142354	|6	|
		|2		|21			|1	|
		|3		|111111222	|-1	|
		|3		|12			|-1	|
		|3		|126		|-1	|
		|1		|1			|0	|