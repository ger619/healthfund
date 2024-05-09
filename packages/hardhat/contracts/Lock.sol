// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

interface IERC20Token {
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address owner) external view returns (uint256);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function totalSupply() external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Lock {
    uint internal patientLength = 0 ;
    address internal tokenAddress = 0xC35C72978dd83B0E8698dFFB764b572a75e53383;

    struct Patient {
        uint id;
        string name;
        uint price;
        string quantity;
        uint sold;
        bool isSoldOut;
    }

    mapping(uint => Patient) internal patients;

    function addPatient(string memory name, uint price, string memory quantity) public {
        patientLength++;
        patients[patientLength] = Patient(patientLength, name, price, quantity, 0, false);
    }

}
