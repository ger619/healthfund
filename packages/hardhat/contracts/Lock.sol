// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

interface IERC20Token {
  function transfer(address, uint256) external returns (bool);
  function approve(address, uint256) external returns (bool);
  function transferFrom(address, address, uint256) external returns (bool);
  function totalSupply() external view returns (uint256);
  function balanceOf(address) external view returns (uint256);
  function allowance(address, address) external view returns (uint256);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Lock{

    uint internal productsLength = 0;

    address internal cUsdTokenAddress = 0x0B7981759F093F77227D10A607336E8f923eDe6e;

    struct Product {
        address payable owner;
        string name;
        string image;
        string description;
        string location;
        uint price;
        uint sold;
    }

    mapping (uint => Product ) internal products;

    function writeProduct(
		uint _index, 
		string memory _name,
		string memory _image,
		string memory _description, 
		string memory _location, 
		uint _price
	) public {
		uint _sold = 0;
		products[_index] = Product(
			payable(msg.sender),
			_name,
			_image,
			_description,
			_location,
			_price,
			_sold
		);
	}

    function readProduct(uint _index) public view returns (
		address payable,
		string memory, 
		string memory, 
		string memory, 
		string memory, 
		uint, 
		uint
	) {
		return (
			products[_index].owner, 
			products[_index].name, 
			products[_index].image, 
			products[_index].description, 
			products[_index].location, 
			products[_index].price,
			products[_index].sold
		);
    }

    function getProductsLength() public view returns (uint) {
        return (productsLength);
    }

    function buyProduct(uint _index) public payable  {
		require(
		  IERC20Token(cUsdTokenAddress).transferFrom(
			msg.sender,
			products[_index].owner,
			products[_index].price
		  ),
		  "Transfer failed."
		);
		products[_index].sold++;
	}
}