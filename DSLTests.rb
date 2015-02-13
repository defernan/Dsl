require 'test/unit'
require_relative 'ProcessOrders.rb'

class DSLTests < Test::Unit::TestCase

	def test_valid_dsl_action
		assert_nothing_raised(NameError){load 'businessRules.txt'}
		assert_nothing_raised(ArgumentError){load 'businessRules.txt'}
	end
	
	def test_invalid_dsl_action_name_error
		assert_raise(NameError){load 'badRules2.txt'}
		
	end
	
	def test_invalid_dsl_action_argument_error
		assert_raise(ArgumentError){load 'badRules.txt'}
	end

end
