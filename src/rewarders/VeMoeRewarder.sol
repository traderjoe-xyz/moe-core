// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {IVeMoe} from "../interfaces/IVeMoe.sol";
import {IVeMoeRewarder} from "../interfaces/IVeMoeRewarder.sol";
import {BaseRewarder} from "./BaseRewarder.sol";

/**
 * @title VeMoe Rewarder Contract
 * @dev The VeMoeRewarder Contract is a contract that is used as a bribery system for the VeMoe contract.
 * Protocols can bribe users to vote on their pools by distributing rewards to veMoe stakers of their pools.
 */
contract VeMoeRewarder is BaseRewarder, IVeMoeRewarder {
    /**
     * @dev Constructor for VeMoeRewarder contract.
     * @param caller The address of the contract that will call the onModify function.
     */
    constructor(address caller) BaseRewarder(caller) {}

    /**
     * @dev Claims rewards for an account.
     * Only the caller contract can call this function.
     * @param account The account to claim rewards for.
     * @param amount The amount of rewards to claim.
     */
    function claim(address account, uint256 amount) public override {
        if (msg.sender != _caller) revert BaseRewarder__InvalidCaller();

        _claim(account, amount);
    }

    /**
     * @dev Gets the total votes of this bribe contract.
     * @return The total votes of this bribe contract.
     */
    function _getTotalSupply() internal view override returns (uint256) {
        return IVeMoe(_caller).getBribesTotalVotes(this, _pid());
    }
}
