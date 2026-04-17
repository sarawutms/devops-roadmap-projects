#!/bin/bash
# test_dashboard.sh - Generate system load

echo "🔥 Generating CPU load for 60 seconds..."
echo "Watch the Netdata dashboard now!"

# Stress the CPU by running 4 workers for 60 seconds
# If 'stress' isn't installed, we use a fallback loop
if command -v stress >/dev/null 2>&1; then
    stress --cpu 4 --timeout 60
else
    echo "Using fallback loop (Ctrl+C to stop)..."
    end=$((SECONDS+60))
    while [ $SECONDS -lt $end ]; do
        : # Do nothing, just loop
    done
fi

echo "🏁 Stress test complete."
