import { ethers } from "hardhat";

async function main() {
 
  const dipsyNft = await ethers.deployContract("DipsyNft");

  await dipsyNft.waitForDeployment();

  console.log(
    `DipsyNft has been deployed to ${dipsyNft.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});