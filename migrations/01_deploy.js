const Vote = artifacts.require("Vote");

module.exports = function (deployer) {
    deployer.deploy(Vote).then(() => {
        return Vote.deployed();
      }).then((instance) => {
        
        console.log("Contract deployed at address:", instance.address);
      });

    
}