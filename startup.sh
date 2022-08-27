prefect_key=`cat /run/secrets/prefect-key`

# Build list of work queues, formatted for CLI command
# - PREFECT_WORK_QUEUES is defined in docker-compose.yml with comma separate names of queues (i.e., name1, name2, name3)
# - The short python script takes that string and converts it to the equivalent of `-q name1 -q name2 -q name3`
python work_queues_list.py > queues.txt
prefect_work_queues=`cat queues.txt`

export PREFECT_API_URL="$PREFECT_API_BASE_URL/api/accounts/$PREFECT_ACCOUNT_ID/workspaces/$PREFECT_WORKSPACE_ID"
export PREFECT_API_KEY="$prefect_key"

echo "PREFECT_API_URL: $PREFECT_API_URL"
echo "PREFECT_PROFILE: $PREFECT_PROFILE"
echo "PREFECT WORK QUEUES: $prefect_work_queues"
ls -l
pwd
ls -l venv/bin/

# bash venv/bin/activate
venv/bin/prefect agent start $prefect_work_queues
pwd
# env/bin/python prefect agent start $prefect_work_queues  # conda
