import { ethers } from "hardhat";
import fs from "fs";

async function main() {
  
  const dipsyNft = await ethers.deployContract("DipsyNft");
  await dipsyNft.waitForDeployment();
  console.log(`DipsyNft has been deployed to ${dipsyNft.target}`);

  let filepath = "../contracts/img/triangle.svg"; 
  let svg = fs.readFileSync(filepath, { encoding: "utf8" });
  console.log(`We will use ${filepath} as our SVG, and this will turn into a tokenURI.`);


  let tx = await dipsyNft.safeMint(svg);
  await tx.wait(1);
  console.log(`You've made your first NFT!`);
  console.log(`You can view the tokenURI here ${await dipsyNft.tokenURI(0)}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
