// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

abstract contract Admin is OwnableUpgradeable {
    mapping(address => bool) public admins;

    event SetAdmin(address indexed admin, bool indexed auth);

    modifier onlyAdmin() {
        require(
            admins[msg.sender] || owner() == msg.sender,
            "Admin: caller is not the admin"
        );
        _;
    }

    function setAdmin(address _user, bool _auth) public onlyOwner {
        admins[_user] = _auth;
        emit SetAdmin(_user, _auth);
    }

    uint256[50] private __gap;
}
