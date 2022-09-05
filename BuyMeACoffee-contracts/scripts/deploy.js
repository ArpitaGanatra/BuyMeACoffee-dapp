const {ethers} = require('hardhat')

async function main() {
  //get contract to deploy
  const BuyMeACoffee = await ethers.getContractFactory('BuyMeACoffee');

  //deploy the contract
  const buyMeACoffee = await BuyMeACoffee.deploy();
  await buyMeACoffee.deployed();

  //BuyMeACoffee deployed to: 0x495E32e0212C85a0120cd769Aa8b52e725A91d37
  console.log('BuyMeACoffee deployed to: ', buyMeACoffee.address);
}

main().then(() => process.exit(0))
.catch((err)=>{
    console.log(err);
    process.exit(1);
})