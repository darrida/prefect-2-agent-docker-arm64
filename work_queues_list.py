import os


work_queues_str = os.environ['PREFECT_WORK_QUEUES']


work_queues_str = work_queues_str.replace(" ", "")
work_queues_l = work_queues_str.split(",")


queues_formatted = [f"-q {x}" for x in work_queues_l]
queues_formatted = ' '.join(queues_formatted)


print(queues_formatted)