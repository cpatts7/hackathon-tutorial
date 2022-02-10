var PropertyLedgerContract = artifacts.require("./PropertyLedgerContract.sol");

module.exports = function(deployer) {
  deployer.deploy(PropertyLedgerContract);
};
