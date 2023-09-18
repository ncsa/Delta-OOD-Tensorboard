# wait for the Tensorboard server to start
echo "$(date): waiting for Tensorboard server to open port ${app_port}..."

echo "${app_port}"
echo "${port}"
echo "${proxy_port}"

if wait_until_port_used "${host}:${port}" 300; then
    echo "$(date): discovered Tensorboard server listening on port ${app_port}!"

#  # wait for the authenticating proxy to start
#  echo "$(date): waiting for authrevproxy server to open port ${proxy_port}..."
#
#    if wait_until_port_used "${node}:${proxy_port}" 60; then
#        echo "$(date): discovered authrevproxy server listening on port ${proxy_port}!"
#    fi

else
  echo "$(date): timed out waiting for Tensorboard server to open port ${app_port}!"
  echo "- wait ended at: $(date)"
  pkill -P ${SCRIPT_PID}
  clean_up 1
fi

sleep 2
