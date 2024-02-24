import { ethers } from "hardhat";

async function main() {
  
  const happyNFT = await ethers.deployContract("HappyNFT");
  await happyNFT.waitForDeployment();
  
  console.log(`HappyNFT has been deployed to ${happyNFT.target}`);

  
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
