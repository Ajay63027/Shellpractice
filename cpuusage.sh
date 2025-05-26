#!/bin/bash
IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
while true; do
  cpu_usage=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk -F'id,' -v prefix="$prefix" '{ split($1, vs, ","); v=vs[length(vs)]; sub("%", "", v); printf "%s%.1f%%\n", prefix, 100 - v }')
  echo "CPU Usage: ${cpu_usage}"
  sleep 1
done

sh mail.sh DevOpsTeam  High_cpu_usage "$IP" "$cpu_usage" ajaymanthurthi6@gmail.com High_cpu_usage