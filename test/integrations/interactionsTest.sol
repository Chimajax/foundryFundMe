// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract interactionsTest is Test {
    FundMe fundMe;

    address USER = makeAddr("user");
    uint256 constant SENDING_BALANCE = 0.1 ether;
    uint256 constant STARTING_BALANCE = 10 ether;
    uint256 constant GAS_PRICE = 1;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, STARTING_BALANCE);
    }

    function testUserCanFundInteractions() public {
        FundFundMe fundFundMe = new FundFundMe();

        vm.deal(USER, 2 ether); // give USER enough ETH
        vm.prank(USER); // prank as USER
        fundFundMe.fundFundMe(address(fundMe));

        address funder = fundMe.getFunder(0);
        assertEq(funder, USER); // ✅ should pass now
    }

    function testUserCanFundInteractions1() public {
        FundFundMe fundFundMe = new FundFundMe();

        // Fund with USER
        vm.deal(USER, 2 ether);
        vm.prank(USER);
        fundFundMe.fundFundMe(address(fundMe));

        // Withdraw as OWNER
        WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
        vm.prank(fundMe.getOwner()); // prank as deployer/owner
        withdrawFundMe.withdrawFundMe(address(fundMe));

        assertEq(address(fundMe).balance, 0);
    }
}
