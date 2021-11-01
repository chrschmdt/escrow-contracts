# Escrow Smart Contracts

These are two smart contracts that provide basic, non-custodial escrow functionality on the blockchain. `Escrow` is a bare-bones escrow contract, while `EscrowTapped` additionally allows the deployer to set an escrow / dev fee. 

While a non-custodial escrow service may not guaruntee that either party will not stiff the other, it takes the incentive out of doing so. To quote Satoshi:

> Imagine if gold turned to lead when stolen.  If the thief gives it back, it turns to gold again.

For more, read Satoshi's full post on [the original bitcointalk thread](https://bitcointalk.org/index.php?topic=750.0).

### Deploying the contracts

These contracts can be deployed on EVM compatible blockchains like Ethereum. Visit the online IDE [Remix](https://remix.ethereum.org/) to interact with the contract locally or deploy it to a blockchain.

### Interacting with the contracts

To interact with the contract on [Etherscan](https://www.etherscan.io/) simply paste the deployed contract address into the serach bar to find the instance, then navigate to the `Contract` tab.
