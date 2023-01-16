# Foundry Workshop

- Why Foundry? - 10 mins
- Workshop - 20 - 30 mins

## Why Foundry?

- Solidity Testing & Scripting

  - No context switching
  - Focus on 1 language
  - Write deployment scripts in Solidity

- Speed

  - Compilation is much faster
    ![](images/fast.png)

- Protocols are adopting

  - [SeaPort]()
  - [UniSwap permit2]()

- Features
  - Fuzzings Tests
  - Interactive Debugger
  - Call traces
  - Gas Reports
  - Solidity Scripting
  - Broadcast Transaction using CLI
  - EVM analysis tools (cast)

## Workshop

### Installation and setup

- https://getfoundry.sh/
- now run:

```
foundryup
```

Now, in order to create a new project type:

```
forge init $PROJECT_NAME$
```

### Foundry tools

Foundry is made of 3 CLI tools - [Forge](https://book.getfoundry.sh/forge/), [Cast](https://book.getfoundry.sh/cast/) and [anvil](https://book.getfoundry.sh/anvil/)

<b>forge</b> - The Foundry CLI tool for compiling, testing and deploying smart contracts.

<b>cast</b> - The Foundry CLI tool for analyzing smart contracts and send transactions.

<b>anvil</b> - A local Ethereum node for testing and development (similart to Ganache / Hardhat Node).

### Create a new project

- ```
  forge init PROJECT_NAME
  ```

### Folder setup

```
├── foundry.toml
├── lib
│   ├── forge-std
│   └── INSTALLED-LIB
├── script
│   └── Contracts.s.sol
├── src
│   └── Contract.sol
└── test
    └── Contract.t.sol
```

- Installed libraries are stored in `lib` folder
- In `src` we are writing our smart contracts
- In `test` we are writing our tests
- In `script` we are writing our deployment scripts

### Installing libraries

Foundry uses git moudles for its libraries mangements, so we won't use npm like as we do in hh/truffle, instead we'll use `forge install $GITHUB_LINK` command to install libraries, ie:

```
forge install OpenZeppelin/openzeppelin-contracts
```

### remappings

- we need to define remappings in `foundry.toml` file in order to use libraries in our contracts.
- Each remapping is defined as a key-value pair in the `remappings` section of the `foundry.toml` file, ie:

```
remappings = [
  '@openzeppelin=lib/opezeeppelin-contracts'
]
```

## Writing a contract

We'll write contract that:

- has a function that gets 0.01 ETH in a mapping
- has a function that returns total ETH recieved by each address
- has an access control that only allows the owner to withdraw the funds and only 5 blocks after the deployment block

## Testing a contract

Tests are written in Solidity and are stored in the `test` folder.

- Every test contract has a function called `setUp` will will be called before every test function is executed
- Each test is a function that starts with `test_` and must be either `public` or `external`
- We can use `assertEq` to check values values
- We can use some cheatcodes like `vm.prank()` `vm.roll()`, and `vm.expectRevert()` for our tests
- Use console.log() to print values

### Fuzzing

- we can simply fuzz by adding an input to a test function
- The fuzzer will randomly generate inputs and run the test function with those inputs
- You can use `vm.assume()` to block some inputs

## Deploying a contract

- contract can be deployed either by:
  - `forge create`
  - running a deployment script

### Forking

- We can run our contract on a forked network by using anvil
  `anvil --fork --rpc-url $FORKING_RPC_URL`

### Resources

- [Foundry book](https://book.getfoundry.sh/)
- [My Cheatsheet](https://github.com/ZenGo-X/foundry-cheatsheet)
