// SPDX-License-Identifier: CC-BY-NC-3.0

pragma solidity ^0.8.4;

/// @author cschmidt.eth
/// @title A simple escrow contract
contract Escrow {
    
    mapping(address => mapping(address => uint256)) private _funds; // wei
    
    /// @param _sender the address paying into the escrow balance
    /// @param _receiver the address receiving from the escrow balance
    /// @return uint256 the balance amount in wei
    function checkBalance(address _sender, address _receiver) public view returns(uint256) {
        return _funds[_sender][_receiver];
    }
    
    /// @param _to the address to which funds will be released
    function depositFunds(address _to) public payable {
        _funds[msg.sender][_to] += msg.value;
    }
    
    /// @param _to the address to which funds will be released
    /// @param _amount the amount of wei to be released
    function releaseFunds(address _to, uint256 _amount) public {
        require(_amount <= _funds[msg.sender][_to], "NSF");
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "failed to send ether");
        _funds[msg.sender][_to] -= _amount;
    }
    
    /// @param _to the address to which funds will be returned
    /// @param _amount the amount of wei to be returned
    function returnFunds(address _to, uint256 _amount) public {
        require(_amount <= _funds[_to][msg.sender], "NSF");
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "failed to send ether");
        _funds[_to][msg.sender] -= _amount;
    }
}
