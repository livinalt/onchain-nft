import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";


const config: HardhatUserConfig = {
  solidity: "0.8.24",

  networks: {  
    hardhat: {     
      },
    sepolia:{
      url: URL1,
      accounts:[`0x${KEY}`],
    },
    
    mumbai:{
      url: URL2,
      accounts:[`0x${KEY}`],
    },
  },

  etherscan: {
    apiKey: {
      polygonMumbai: "FM1JSY9NCT3PX8I79EB7VHFRW6DN9K27DC"
  }
}
};

export default config;