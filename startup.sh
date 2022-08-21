prefect_key=`cat /run/secrets/prefect-key`

python queues_list.py > queues.txt
prefect_work_queues=`cat queues.txt`

export PREFECT_API_URL="$PREFECT_API_BASE_URL/api/accounts/$PREFECT_ACCOUNT_ID/workspaces/$PREFECT_WORKSPACE_ID"
export PREFECT_API_KEY="$prefect_key"

echo "PREFECT_API_URL: $PREFECT_API_URL"
echo "PREFECT_PROFILE: $PREFECT_PROFILE"
echo "PREFECT WORK QUEUES: $prefect_work_queues"

prefect agent start $prefect_work_queues