## CIBC Hackathon Tutorial Project

## Requirements
  1. Latest truffle version.
     ```console
     npm -g uninstall truffle && npm -g install truffle
     ```
  2. ```console
     npm install -g ganache-cli
     ```
  3. ```console
     npm install -g @remix-project/remixd
     ```
  4. Install Ganache GUI (optional)

## Local Testing

  1. ```console
     npm install
     ```
  2. Load truffle-config.js into ganache or in a separate CMD console:
  2b. Run Ganache
      ```console
     ganache
     ```
  3. ```console
     truffle test
     ```

## Local Testing using REMIX

   1. ```console
     remixd -s e:\git\hackathon-tutorial
     ```
   2. ```console
     ganache
     ```
   3. Use chrome and visit: https://remix.ethereum.org/
   4. In the workspaces dropdown (top left) select localhost and press ok. 
   5. Open up the contracts folder, right click the PropertyLedgerContract.sol file and click Compile
   6. Select the deploy tab (menu on the far left)
   7. Choose Web3 Provider from the Environment dropdown (this connects to your local ganache. You can leave it as VM london which leverages a public test environment). 
   8. Select the Property contract from the Contract dropdown and select publish. 
   9. You can then interact with this contract in the deployed section at the bottom. 

## About
Author: Chris Patterson
