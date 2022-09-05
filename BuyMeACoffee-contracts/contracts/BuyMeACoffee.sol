// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";

contract BuyMeACoffee {
    //Event to emit when a memo is created
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    //Memo -> struct
    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    //List of all memos recieved
    Memo[] memos;

    //store owner's address to withdraw funds
    address payable owner;

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = payable(msg.sender);
    }

    /**
    * fuction to buy a coffee for contract owner
    * @param _name name of the coffee buyer
    * @param _message message the friend wants to give to the owner along with the coffee
    */
    function buyCoffee(string memory _name, string memory _message) public payable {
        require(msg.value > 0, "cant buy coffee with 0 Eth");

        //add a new memo to list of memos
        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));

        // emit memo event to keep a log
        emit NewMemo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        );
    }

    /**
    * send all the balance in contract to contract owner
    */
    function withdrawTips() public onlyOwner {
        owner.transfer(address(this).balance);
    }

    /**
    * retrieve all the memos recieved by the contract
    */
    function getMemos() public view returns(Memo[] memory) {
        return memos;
    }


}
