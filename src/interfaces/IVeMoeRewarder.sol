// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IBaseRewarder} from "./IBaseRewarder.sol";

interface IVeMoeRewarder is IBaseRewarder {
    function claim(address account, uint256 amount) external;
}
