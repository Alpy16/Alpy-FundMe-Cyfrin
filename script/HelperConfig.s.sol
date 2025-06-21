// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/MockV3Aggregator.sol";

contract HelperConfig is Script {
    struct NetworkConfig {
        address priceFeed;
    }

    NetworkConfig private activeConfig;

    uint8 private constant DECIMALS = 8;
    int256 private constant INITIAL_PRICE = 2000e8;

    constructor() {
        if (block.chainid == 11155111) {
            activeConfig = getSepoliaEthConfig();
        } else if (block.chainid == 31337) {
            activeConfig = getOrCreateAnvilEthConfig();
        } else {
            activeConfig = getMainnetEthConfig();
        }
    }

    function activeNetworkConfig() external view returns (NetworkConfig memory) {
        return activeConfig;
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        return NetworkConfig({priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306});
    }

    function getMainnetEthConfig() public pure returns (NetworkConfig memory) {
        return NetworkConfig({priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419});
    }

    function getOrCreateAnvilEthConfig() public returns (NetworkConfig memory) {
        if (activeConfig.priceFeed != address(0)) {
            return activeConfig;
        }

        vm.startBroadcast();
        MockV3Aggregator mock = new MockV3Aggregator(DECIMALS, INITIAL_PRICE);
        vm.stopBroadcast();

        activeConfig = NetworkConfig({priceFeed: address(mock)});
        return activeConfig;
    }
}
