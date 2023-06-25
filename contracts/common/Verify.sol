// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

abstract contract Verify is OwnableUpgradeable {
    address private publicKey;

    function verify(
        bytes32 _hashMessage,
        uint8 _v,
        bytes32 _r,
        bytes32 _s
    ) internal view returns (bool) {
        return ecrecover(_hashMessage, _v, _r, _s) == publicKey;
    }

    function setPublicKey(address _key) public onlyOwner {
        publicKey = _key;
    }

    function getPublicKey() public view onlyOwner returns (address) {
        return publicKey;
    }

    uint256[50] private __gap;
}
