// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IMoe is IERC20 {
    error Moe__NotMinter(address account);
    error Moe__InvalidInitialSupply();

    function getMinter() external view returns (address);

    function getMaxSupply() external view returns (uint256);

    function mint(address account, uint256 amount) external returns (uint256);
}
