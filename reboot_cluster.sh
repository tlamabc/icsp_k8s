#!/bin/bash
#### List hosts need to reboot below 
 
# Define your remote hosts here
hosts=(10.0.0.151  10.0.0.152 10.0.0.153)
# Define the username
user="root"

# Function to check if a host is reachable
check_host() {
  host=$1
  while true; do
    if ping -c 1 "$host" &> /dev/null; then
      echo "$host is back online."
      break
    else
      echo "Waiting for $host to become reachable..."
      sleep 5
    fi
  done
}

# Loop through each host and reboot it
for host in "${hosts[@]}"; do
  echo "Rebooting $host..."
  ssh "$user@$host" 'sudo reboot' &

  # Wait for a short time before checking the host status
  sleep 10
  check_host "$host"
done

echo "All hosts have been rebooted and are back online."
