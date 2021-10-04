#!/bin/bash

USAGE="  $0 is the main control script for the testnet.\n
         Usage : $0 start --val-num|-n <num of validators> 
                    stop
                    clean
                    status
        "

function help()
{
  echo $usage
}

function generate_network_configs()
{
  nvals=$1
  echo "Generating network configuration for $nvals validators..."
  echo "  done!"
}

function start_network()
{
  nvals=$1
  echo "Starting network with $nvals validators..."
  # TESTNET_NAME=$TESTNET_NAME docker-compose -f docker-compose-testnet.yml up -d
  echo "  network started!"
}

function stop_network()
{
  echo "Stopping network..."
  # TESTNET_NAME=$TESTNET_NAME docker-compose -f docker-compose-testnet.yml down
  echo "  stopped!"
}

function print_status()
{
  echo "Printing status of the  network..."
  # TESTNET_NAME=$TESTNET_NAME docker-compose -f docker-compose-testnet.yml status
  echo "  Finished!"
}

function do_cleanup()
{
  echo "Cleaning up network configuration..."
  # rm -rf ${DEPLOYMENT_DIR}/*
  echo "  clean up finished!"
}


ARGS="$@"

if [ $# -lt 1 ]
then
  echo "No args"
  help
  exit 1
fi

while [ "$1" != "" ]; do
  case $1 in
    "start" ) shift
      while [ "$1" != "" ]; do
        case $1 in 
             -n|--val-num ) shift
               VAL_NUM=$1
               ;;
        esac
        shift
      done
      start_network $VAL_NUM
      exit
      ;;
    "configure" ) shift
      while [ "$1" != "" ]; do
        case $1 in 
             -n|--val-num ) shift
               VAL_NUM=$1
               ;;
        esac
        shift
      done
      generate_network_configs $VAL_NUM
      exit
      ;;
    "stop" ) shift
      stop_network
      exit
      ;;
    "status" ) shift
      print_status
      exit
      ;;
    "clean" ) shift
      do_cleanup
      exit
      ;;
  esac
  shift
done
