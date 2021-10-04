# blockchain-docker-testnet-template
Template repository to help the integration of new blockchain networks in the blockchain benchmarking framework

## Structure
 * /deployment
Hosts all the files that are generated during the deployment of the network. Such files are configuration files, keys, common/extracted files during the creation of the network (ex. bootnodes.txt, validators_map etc)
 * /templates
Hosts all template files used to generate configuration files, and docker-compose files of the network
 * /scripts
Hosts all the scripts used. ```scripts/helper_functions.sh``` scripts is an example of what functions are expected to be implemented in such script.
 * /docker
Hosts all the docker related files used to build docker images. 

## Basic functionality
The basic functionality should be implemented by the ```control.sh``` script.
```
control.sh is the main control script for the testnet.
Usage : control.sh <action> <arguments>

Actions:
  start     --val-num|-n <num of validators>
       Starts a network with <num_validators> 
  configure --val-num|-n <num of validators>
       configures a network with <num_validators> 
  stop
       Stops the running network
  clean
       Cleans up the configuration directories of the network
  status
       Prints the status of the network

```

## Authors/Contributors
* Antonios Inglezakis (@antIggl) [ inglezakis.a@unic.ac.cy ]

# Acknowledgments
This work is funded by the Ripple’s Impact Fund, an advised fund of Silicon Valley Community Foundation (Grant id: 2018–188546). Link: [ubri.ripple.com]
