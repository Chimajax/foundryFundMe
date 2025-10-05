# Foundry Fund Me

A Project by Patrick C. from cyfrin built with [Foundry](https://book.getfoundry.sh/) to learn smart contract development, testing, and deployment.  
This contract allows users to fund the contract with ETH, tracks contributors, and lets the owner withdraw the funds.

---

## Features

- Accept ETH from multiple funders
- Track each funder’s contributions
- Restrict withdrawals to the contract owner
- Unit and integration tests with **Forge**
- Local blockchain testing with **Anvil**
- Deployment scripts included

---

## Requirements

- [Foundry](https://book.getfoundry.sh/getting-started/installation) installed  
- [Node.js & npm](https://nodejs.org/) (optional for scripts)  
- A local blockchain (Anvil) or testnet/mainnet RPC provider  

---

## Installation

Clone the repo:

```bash
git clone https://github.com/$(your-username)/foundry-fund-me.git
cd foundry-fund-me
````

Install dependencies:

```bash
forge install
```

Build contracts:

```bash
forge build
```

---

## Usage

### Start a local blockchain

```bash
anvil
```

### Deploy contract

```bash
forge script script/DeployFundMe.s.sol --rpc-url http://127.0.0.1:8545 --private-key <YOUR_PRIVATE_KEY> --broadcast
```

### Run tests

```bash
forge test
```

### Interact with contract

Using `cast`:

```bash
cast send <FUNDME_CONTRACT_ADDRESS> "fund()" --value 1ether --private-key <YOUR_PRIVATE_KEY> --rpc-url http://127.0.0.1:8545
cast call <FUNDME_CONTRACT_ADDRESS> "getFunder(uint256)" 0
```

---

## Project Structure

```
├── contracts/          # Solidity contracts
│   └── FundMe.sol
├── script/             # Deployment scripts
│   └── DeployFundMe.s.sol
├── test/               # Unit & integration tests
│   └── FundMe.t.sol
├── foundry.toml        # Foundry config file
└── README.md           # Project documentation
```

---

## Resources

* [Foundry Book](https://book.getfoundry.sh/)
* [Solidity Docs](https://docs.soliditylang.org/)
* [Patrick Collins’ Foundry Course](https://github.com/smartcontractkit/full-blockchain-solidity-course-js)

---

## License

This project is licensed under the MIT License.
