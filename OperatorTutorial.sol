pragma solidity ^0.4.17;

contract OperatorTutorial {

    function booleanOperatorTest(bool foo, bool bar) public pure
        returns (bool negation, bool conjunction, bool disjunction, bool equality, bool inequality) {

        // Negate the variable "foo" and assign the result to variable "negation"
        negation = !foo;

        // Use logical "and" on variables "foo" and "bar" and assign the result to variable "conjunction"
        conjunction = (foo && bar);

        // Use logical "or" on variables "foo" and "bar" and assign the result to variable "disjunction"
        disjunction = foo || bar;

        // Make sure variable "equality" is true when "foo" and "bar" are equal and is false otherwise.
        equality = foo == bar;

        // Make sure variable "inequality" is true when "foo" and "bar" are not equal and is false otherwise.
        inequality = !equality;

    }

    function integerOperatorTest(uint x, uint y) public pure
        returns (uint sum, uint difference, uint product, uint quotient, uint remainder, uint power){

        // Make sure variable "sum" is equal to the sum of "x" and "y"
        sum = x + y;
 
        // Subtract "y" from "x" and assign the result to variable "difference"
        difference = x - y;

        // Multiply "x" and "y" and assign the result to variable "product"
        product = x * y;

        // Divide "x" by "y" and assign the result to variable "quotient"
        quotient = x / y;

        // Make sure "remainder" is equal to the remainder of "x" and "y"
        remainder = x % y;

        // Raise "x" to the power of "y" and assign the result to variable "power"
        power = x**y;

    }

    function addressOperatorTest(address owner, address sender) public pure returns (bool matches, bool doesntMatch) {

        // Make sure variable "matches" is true when "owner" and "sender" are the same
        matches = owner == sender;

        // Make sure variable "doesntMatch" is true when "owner" and "sender" are NOT the same
        doesntMatch = owner != sender;
 
    }
}