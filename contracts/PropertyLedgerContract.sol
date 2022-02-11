// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract PropertyLedgerContract is Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _propertyRecordIds;

    bool recordsPublishingOpen;

    struct PropertyRecord
    {
        uint256 id;
        string propertyAddress;
        string ownerName;
        string soldDate;
        address recordedBy;
    }

    mapping (uint256 => PropertyRecord) propertyRecordIdMapping;

    constructor() {
      recordsPublishingOpen = true;
    }

    function recordPropertyPurchase(string memory _propertyAddress, string memory _ownerName, string memory _soldDate) public returns (uint256) {
        require(recordsPublishingOpen);
        _propertyRecordIds.increment();
        uint256 _id = _propertyRecordIds.current();

        PropertyRecord memory pr = PropertyRecord ({
            id: _id,
            propertyAddress: _propertyAddress,
            ownerName: _ownerName,
            soldDate: _soldDate,
            recordedBy: _msgSender()
        });

        propertyRecordIdMapping[_id] = pr;

        return _id;
    }

    function getPropertyRecord(uint propertyRecordId) public view returns (string memory _propertyAddress, string memory _ownerName, string memory _soldDate, address _recordedBy) {
        require (propertyRecordId > 0);
        require (propertyRecordId <= _propertyRecordIds.current());

        PropertyRecord memory pr = propertyRecordIdMapping[propertyRecordId];
        _propertyAddress = pr.propertyAddress;
        _ownerName = pr.ownerName;
        _soldDate = pr.soldDate;
        _recordedBy = pr.recordedBy;
    }

    function setRecordsPublishingOpen(bool val) public onlyOwner {
        recordsPublishingOpen = val;
    }
}