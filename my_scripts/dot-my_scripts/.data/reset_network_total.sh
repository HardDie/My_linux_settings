#!/bin/bash

INTERFACE=wlp0s20f3

cat /sys/class/net/wlp0s20f3/statistics/rx_bytes > /tmp/network_rx_reset
cat /sys/class/net/wlp0s20f3/statistics/tx_bytes > /tmp/network_tx_reset
