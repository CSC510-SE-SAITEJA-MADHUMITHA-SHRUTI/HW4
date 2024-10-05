# Finding ID (PID) of infinite.sh
PID=$(pgrep -f infinite.sh)

# Finding process and killing it
if [ ! -z "$PID" ]; then
    echo "Killing infinite.sh process with PID: $PID"
    kill -9 $PID
    echo "Process terminated."
else
    echo "No infinite.sh process running."
fi