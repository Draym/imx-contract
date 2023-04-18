# Contract for IMX

## Immutable Contract Addresses

| Environment/Network       | Core (StarkEx Bridge) Contract                                                                                                | User Registration Contract                                                                                                    |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **Sandbox (Goerli)**      | [0x7917edb51ecd6cdb3f9854c3cc593f33de10c623](https://goerli.etherscan.io/address/0x7917eDb51ecD6CdB3F9854c3cc593F33de10c623)  | [0x1c97ada273c9a52253f463042f29117090cd7d83](https://goerli.etherscan.io/address/0x1C97Ada273C9A52253f463042f29117090Cd7D83)  |
| **Production (Mainnet)**  | [0x5fdcca53617f4d2b9134b29090c87d01058e27e9](https://etherscan.io/address/0x5FDCCA53617f4d2b9134B29090C87D01058e27e9)         | [0x72a06bf2a1CE5e39cBA06c0CAb824960B587d64c](https://etherscan.io/address/0x72a06bf2a1CE5e39cBA06c0CAb824960B587d64c)         |

## Setup

You will need an Ethereum wallet private key to deploy contracts.
Also required are API keys for [Alchemy](https://www.alchemy.com/) and [Etherscan](https://etherscan.io/) to deploy contracts from this repo.

1. Make a copy of the `.env.example` file and rename the file to `.env`.
2. Add private keys and API keys to the `.env` file.

**Note:** All the environment variables in `.env` need a value or hardhat will throw an error.

# IMX contract deployment

## Setup

You will need an Ethereum wallet private key to deploy contracts.
Also required are API keys for [Alchemy](https://www.alchemy.com/) and [Etherscan](https://etherscan.io/) to deploy contracts from this repo.

1. Make a copy of the `.env.example` file and rename the file to `.env`.
2. Add private keys and API keys to the `.env` file.

**Note:** All the environment variables in `.env` need a value or hardhat will throw an error.

For each deployment you should update the following `.env` variables:
- `CONTRACT_NAME`
- `CONTRACT_SYMBOL`

## IMX Collection

The owner of this contract will be the address which deploy it.

If necessary you can change the owner of the contract on chain by calling `contract.transferOwnership(ownerAddress)`

The concept of collection owner in IMX is crucial. Only the owner will be able to mint to NFT using the [IMX API](https://docs.x.immutable.com/reference/#/operations/mintTokensV1).

## Deployment
### Tesnet - Goerli

run `npm run deploy-goerli`

### Mainnet

run `npm run deploy-mainnet`
