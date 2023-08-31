//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

import {LongHouseProxy} from "./LongHouseProxy.sol";
import {LongHouse} from "./LongHouse.sol";

// @title LongHouseFactory
// @author promatheus
contract LongHouseFactory is OwnableUpgradeable, UUPSUpgradeable {

  address public immutable implementation;

  /// @notice Emit when a new LongHouse contract is created
  event LongHouseCreated(address mergeNFT, address owner);

  /// @notice Only address different from address(0) is accepted
  error AddressCannotBeZero();

  // @notice Initializes factory with address of implementation contract
  /// @param _implementation InviteMint implementation contract to clone
  constructor(address _implementation) external initializer {
    if (_implementation == address(0)) revert AddressCannotBeZero();

    implementation = _implementation;
  }

  /// @notice Initializes the proxy contract
  function initialize() external initializer {
    __Ownable_init();
    __UUPSUpgradeable_init();
  }

  /// @dev Function to determine who is allowed to upgrade this contract.
  function _authorizeUpgrade(address _newImplementation) internal override onlyOwner {}


  function createNewLongHouse() public payable returns (address newLongHouseAddress) {

  }

}