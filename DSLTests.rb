require 'test/unit'
require_relative 'ProcessOrders.rb'

class DSLTests < Test::Unit::TestCase

	def test_valid_dsl_action
		assert_nothing_raised(NameError){load 'C:\Users\Isaac\Desktop\Desktop\School\Mines\Spring2015\ProgrammingLanguages\DSL\Dsl\businessRules.txt'}
		assert_nothing_raised(ArgumentError){load 'C:\Users\Isaac\Desktop\Desktop\School\Mines\Spring2015\ProgrammingLanguages\DSL\Dsl\businessRules.txt'}
		
	end
	
	def test_invalid_dsl_action_name_error
		assert_raise(NameError){load 'C:\Users\Isaac\Desktop\Desktop\School\Mines\Spring2015\ProgrammingLanguages\DSL\Dsl\badRules2.txt'}
		
	end
	
	def test_invalid_dsl_action_argument_error
		assert_raise(ArgumentError){load 'C:\Users\Isaac\Desktop\Desktop\School\Mines\Spring2015\ProgrammingLanguages\DSL\Dsl\badRules.txt'}
	end

end