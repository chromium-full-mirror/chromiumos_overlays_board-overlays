#!/bin/bash

readarray -t CONTROLLERS < <(find /sys/bus/pci/drivers/xhci_hcd/ -maxdepth 1 -type l -printf "%f\n")

for hcd in "${CONTROLLERS[@]}"; do
    echo "${hcd}" > /sys/bus/pci/drivers/xhci_hcd/unbind
done
for hcd in "${CONTROLLERS[@]}"; do
    echo "${hcd}" > /sys/bus/pci/drivers/xhci_hcd/bind
done
