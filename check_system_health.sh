log_file="system_health.log"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")


cpu_usage=$(top -bn1 | awk '/Cpu/ {print 100 - $8}')

read mem_total mem_used <<< $(free | awk '/Mem:/ {print $2, $3}')
mem_usage=$(( (100 * mem_used) / mem_total ))

if (( $(echo "$cpu_usage > 80" | bc -l) )); then
	STATUS="High CPU usage : $cpu_usage%"
elif [ "$mem_usage" -gt 80 ]; then
	STATUS="High memory usage : $mem_usage%"
else
	STATUS="System is healthy."
fi

echo "$timestamp - CPU: $cpu_usage% | Memory: $mem_usage% | Status: $STATUS" >> "$log_file"
