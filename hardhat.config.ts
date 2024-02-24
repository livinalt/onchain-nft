import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require("dotenv").config();

const config: HardhatUserConfig = {
  solidity: "0.8.24",

  networks: {  
    hardhat: {     
      },
    sepolia:{
      url: URL,
      accounts:[`0x${KEY}`],
    },
  },
};

export default config;