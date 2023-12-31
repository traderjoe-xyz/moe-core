// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

interface IMoeFactory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint256);
    event FeeToSet(address indexed feeTo);

    function feeTo() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint256) external view returns (address pair);
    function allPairsLength() external view returns (uint256);

    function moePairImplementation() external view returns (address);
    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
}
