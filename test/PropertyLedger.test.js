const { catchRevert } = require("./exceptionsHelpers.js");
var PropertyLedgerContract = artifacts.require("./PropertyLedgerContract.sol");


contract("PropertyLedgerContract", function (accounts) {
    const [contractOwner, chris, alice] = accounts;
    const emptyAddress = "0x0000000000000000000000000000000000000000";

    beforeEach(async () => {
        instance = await PropertyLedgerContract.new();
        
      });

      it("Is owned by owner", async () => {
        assert.equal(
          await instance.owner.call(),
          contractOwner,
          "owner is not correct",
        );
      });
      
      it("Can add item to ledger", async () => {
        
        await instance.recordPropertyPurchase("1234 Street, Toronto", "John Smith", "2022-01-01", {from: chris});
        
        const item = await instance.getPropertyRecord(1);
        assert.equal(
            item[0],
            "1234 Street, Toronto",
            "Property Address does not match",
        );

        assert.equal(
            item[1],
            "John Smith",
            "New Owner does not match",
        );

        assert.equal(
            item[2],
            "2022-01-01",
            "Sold Date does not match",
        );

        assert.equal(
            item[3],
            chris,
            "Recorded by does not match",
        );

      });

    });