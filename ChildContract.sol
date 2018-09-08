pragma solidity ^0.4.17;

contract ParentContract {

    // Write your functions here
	function helloExternal() external returns (string) {
        return "external";
    }
    
    function helloInternal() internal returns (string) {
        return "internal";
    }
    
    function helloPublic() public returns (string) {
        return "public";
    }
    
    function helloPrivate() private returns (string) {
        return "private";
    }
}

contract ChildContract is ParentContract {

    // Write your functions here

}