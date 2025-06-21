# Alpy FundMe — Decentralized Crowdfunding on Ethereum

[![Foundry](https://img.shields.io/badge/Forged%20with-Foundry-blue)](https://github.com/foundry-rs/foundry)  
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Alpy FundMe is a decentralized crowdfunding smart contract built on Ethereum, following the Cyfrin Updraft curriculum. It enables users to contribute ETH to the contract, with a minimum contribution enforced in USD terms via Chainlink price feeds. The contract owner can withdraw the accumulated funds.

Features:  
- Fund contract with ETH  
- USD-denominated minimum contribution (5 USD)  
- Restricted withdrawals (only owner)  
- Optimized withdrawal function  
- Deployment to Sepolia testnet  
- Comprehensive unit and integration tests using Foundry  
- Automated deployment and interaction scripts  
- Aligned with modern Solidity best practices  

Quick start guide:

Requirements:  
- Foundry v1.2.3 or newer  
- Alchemy API Key (Sepolia)  
- Ethereum wallet private key with testnet ETH  
- Etherscan API Key  

Installation:
```bash
git clone https://github.com/Alpy16/Alpy-FundMe-Cyfrin.git
cd Alpy-FundMe-Cyfrin
forge install
```

Environment configuration:  
Create a `.env` file with the following content:
```env
SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/your-alchemy-key
PRIVATE_KEY=your-wallet-private-key
ETHERSCAN_API_KEY=your-etherscan-api-key
```

Usage:

Build contracts:
```bash
forge build
```

Run tests:
```bash
forge test
```

Deploy to Sepolia:
```bash
make deploy-sepolia
```

Scripts:

Fund the contract:
```bash
forge script script/Interactions.s.sol:FundFundMe --broadcast --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY
```

Withdraw funds:
```bash
forge script script/Interactions.s.sol:WithdrawFundMe --broadcast --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY
```

Project structure:
```
src/                Solidity contracts
test/               Unit and integration tests
script/             Deployment and interaction scripts
lib/                External libraries
foundry.toml        Foundry configuration
remappings.txt      Import remappings
Makefile            CLI automation commands
```

License:  
This project is licensed under the MIT License.
