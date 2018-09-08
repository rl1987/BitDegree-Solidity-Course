pragma solidity ^0.4.17;

contract ModifiersTutorial {

    address public owner;
    uint256 public price = 0;

    //
    // Write your modifier here
    //
	modifier onlyOwner() {
        if (msg.sender != owner)
            throw;
        
        _;
    }
    
    // Use your modifier on the function below
    function changePrice(uint256 _price) onlyOwner public {
        price = _price;
    }

    function ModifiersTutorial () {
        owner = msg.sender; // msg.sender in constructor equals to the address that created the contract
    }
}