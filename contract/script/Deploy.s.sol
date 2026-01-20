// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import {Script, console} from "forge-std/Script.sol";
import {HonkVerifier} from "../Verifier.sol";
import {Starter} from "../Starter.sol";

contract DeployScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        // Deploy Verifier first
        HonkVerifier verifier = new HonkVerifier();
        console.log("HonkVerifier deployed at:", address(verifier));

        // Deploy Starter with Verifier address
        Starter starter = new Starter(verifier);
        console.log("Starter deployed at:", address(starter));

        vm.stopBroadcast();
    }
}
