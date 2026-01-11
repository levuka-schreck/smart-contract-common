// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title MockUSDC
 * @dev Mock USDC token for local testing
 * USDC has 6 decimals, not the standard 18
 */
contract MockUSDC is ERC20, Ownable {

    uint8 private _decimals = 6;

    constructor() ERC20("USD Coin", "USDC") Ownable(msg.sender) {
        // Mint 1 million USDC to deployer for testing
        _mint(msg.sender, 1_000_000 * 10**_decimals); // 1M USDC with 6 decimals
    }

    /**
     * @dev Returns 6 decimals to match real USDC
     */
    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }

    /**
     * @dev Mint function for testing - allows anyone to mint tokens
     * In production USDC, only authorized addresses can mint
     */
    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }

    /**
     * @dev Faucet function - gives caller 1,000,000 USDC for testing
     */
    function faucet() external {
        _mint(msg.sender, 1_000_000 * 10**_decimals); // 1M USDC
    }
}
