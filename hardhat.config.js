require("@nomiclabs/hardhat-waffle");
require('dotenv').config();

const PRIVATE_KEY = process.env["MY_PRIVATE_KEY"];

module.exports = {
  solidity: "0.8.0",
  networks: {
    ropsten: {
        url: "https://ropsten.infura.io/v3/16c1a9ae02fc4856b28f116d862acc69",
        accounts: [`0x${PRIVATE_KEY}`]
    }
  },
  compilers: {
    solc: {
      version: "0.8.0"    // Fetch exact version from solc-bin (default: truffle's version)
    }
  }
};
