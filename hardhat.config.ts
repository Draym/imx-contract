import "@nomiclabs/hardhat-waffle"
import "@nomiclabs/hardhat-etherscan"
import "@nomiclabs/hardhat-ethers"
import "@nomiclabs/hardhat-solhint"
import "hardhat-gas-reporter"
import "solidity-coverage"
import "hardhat-contract-sizer"
import {task} from "hardhat/config"

require("dotenv").config()

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
    const accounts = await hre.ethers.getSigners()

    for (const account of accounts) {
        console.log(account.address)
    }
})

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
    solidity: {
        version: "0.8.4",
        settings: {
            optimizer: {
                enabled: true,
                runs: 200
            }
        }
    },
    defaultNetwork: "goerli",
    networks: {
        goerli: {
            url: `https://eth-goerli.g.alchemy.com/v2/${process.env.ALCHEMY_GOERLI_API_KEY}`,
            accounts: [`0x${process.env.DEPLOYER_TESTNET_PRIVATE_KEY}`],
        },
        mainnet: {
            url: `https://eth-mainnet.alchemyapi.io/v2/${process.env.ALCHEMY_MAINNET_API_KEY}`,
            accounts: [`0x${process.env.DEPLOYER_MAINNET_PRIVATE_KEY}`],
        },
    },
    gasReporter: {
        enabled: true,
        currency: "USD"
    },
    contractSizer: {
        alphaSort: false,
        disambiguatePaths: false,
        runOnCompile: true,
        strict: false
    },
    etherscan: {
        apiKey: process.env.ETHERSCAN_API_KEY,
    },
}
