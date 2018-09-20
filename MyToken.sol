pragma solidity ^0.4.17;

contract ERC20 {

    uint256 public totalSupply;

    function balanceOf(address who) public constant returns (uint256);
    function allowance(address owner, address spender) public constant returns (uint256);

    function transfer(address to, uint256 value) public returns (bool);
    function transferFrom(address from, address to, uint256 value) public returns (bool);
    function approve(address spender, uint256 value) public returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

}

contract MyToken is ERC20 {
    mapping (address => mapping (address => uint256)) allowed;
    mapping(address => uint256) balances;

    function MyToken() {
        // There will be 5 million tokens
        totalSupply = 5 * (10 ** 6);

        // All initial tokens belong to the owner
        balances[msg.sender] = totalSupply;
    }

    // Gets the balance of the specified address.
    function balanceOf(address _owner) constant returns (uint256 balance) {
        // Return the balance of _owner
        return balances[_owner];
    }

    // Transfer tokens to a specified address
    function transfer(address _to, uint256 _value) returns (bool) {
        require(balances[msg.sender] >= _value);

        // Decrease the balance of the sender by _value
        balances[msg.sender] = balances[msg.sender] - _value;
        // Then, increase the value of _to by _value
		balances[_to] = balances[_to] + _value;
        
        Transfer(msg.sender, _to, _value);
        return true;
    }

    //  Transfer tokens from one address to another
    function transferFrom(address _from, address _to, uint256 _value) returns (bool) {
        var _allowance = allowed[_from][msg.sender];

        // Make sure the function does not get executed if _allowance is lower than _value
        require(_allowance >= _value);
        // Make sure the balance of _from is larger than _value
		require(balances[_from] >= _value);
        
        balances[_to] = balances[_to] + _value;
        balances[_from] = balances[_from] - _value;
        allowed[_from][msg.sender] = _allowance - _value;

        Transfer(_from, _to, _value);

        return true;
    }

    // Function to check the amount of tokens that an owner allowed to a spender
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

    // Approve the passed address to spend the specified amount of tokens on behalf of msg.sender
    function approve(address _spender, uint256 _value) returns (bool) {
        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        require((_value == 0) || (allowed[msg.sender][_spender] == 0));
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }