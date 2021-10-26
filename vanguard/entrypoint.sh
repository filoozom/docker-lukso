#!/bin/bash  

VANGUARD_BOOTNODES=(${VANGUARD_BOOTNODES//,/ })
BOOTNODES_ARGS=()
for n in "${VANGUARD_BOOTNODES[@]}"; do
  BOOTNODES_ARGS+=("--bootstrap-node=$n")
done

ARGUMENTS=(
  "--accept-terms-of-use"
  "--chain-id=$CHAIN_ID"
  "--network-id=$NETWORK_ID"
  "--genesis-state=/opt/lukso/networks/$NETWORK/config/vanguard-genesis.ssz"
  "--datadir=/data/"
  "--chain-config-file=/opt/lukso/networks/$NETWORK/config/vanguard-config.yaml"
  "${BOOTNODES_ARGS[@]}"
  "--http-web3provider=http://127.0.0.1:8545"
  "--deposit-contract=0x000000000000000000000000000000000000cafe"
  "--contract-deployment-block=0"
  "--rpc-host=$VANGUARD_RPC_HOST"
  "--monitoring-host=$VANGUARD_MONITORING_HOST"
  "--verbosity=$VANGUARD_VERBOSITY"
  "--min-sync-peers=2"
  "--p2p-max-peers=50"
  "--orc-http-provider=http://127.0.0.1:7877"
  "--rpc-port=4000"
  "--p2p-udp-port=12000"
  "--p2p-tcp-port=13000"
  "--grpc-gateway-port=3500"
  "--update-head-timely"
  "--lukso-network"
)

if [[ -n $VANGUARD_P2P_PRIV_KEY ]]; then
  ARGUMENTS=("${ARGUMENTS[@]}" "--p2p-priv-key=$VANGUARD_P2P_PRIV_KEY")
fi

if [[ -n $VANGUARD_P2P_HOST_DNS ]]; then
  ARGUMENTS=("${ARGUMENTS[@]}" "--p2p-host-dns=$VANGUARD_P2P_HOST_DNS")
else
  ARGUMENTS=("${ARGUMENTS[@]}" "--p2p-host-ip=$EXTERNAL_IP")
fi

echo "${ARGUMENTS[@]}"
/usr/local/bin/app "${ARGUMENTS[@]}"
