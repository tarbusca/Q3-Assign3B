/**
Assignment 3B
Please complete the ERC20 token with the following extensions;
1) - Capped Token: The minting token should not be exceeded from the Capped limit.
2)- TimeBound Token: The token will not be transferred until the given time exceed. For example Wages payment will be due after 30
days.
3) should be deployed by using truffle or hardhat on any Ethereum test network
 */
pragma solidity ^0.8.0;
//"SPDX-License-Identifier: UNLICENSED"

/**
 * Tariq Saeed 
 * PIAIC 111569
 */
 // Contract Ropsten Address : 0x281F42d27182D9DdC3337E7EF9ab1886E6Ebd8C7
//if you run these in Remix, the imports will work.
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TariqToken3B is Ownable, ERC20 {
    uint256 private curSupply;
    uint256 private tokenCap = 2000000*(10**decimals());    //3B.1
    uint256 private contractBirthday;
    uint256 public constant MINIMUM_DELAY = 30 days;
    
    constructor (string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 1000000*(10**decimals()));
        contractBirthday = block.timestamp;  //3B.2
    }

        fallback() external payable {}
        receive() external payable{}
    
    //3B.1 Shows the toal cap of token  
        function cap() public view virtual returns (uint256) {
        return tokenCap;
    }
        function mint(address account, uint256 amount) external {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: Token Cap exceeded");
        _mint(account, amount);
    }
    //3B.2
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        require(block.timestamp > contractBirthday + MINIMUM_DELAY);
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
    
}
