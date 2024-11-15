[
    {
          "name": "${ecs_task_api_container_name}-${ecs_task_api_environment}",
          "image": "${aws_account}.${ecs_task_api_image_arn}:${ecs_task_ecr_image_version}",
          "cpu": ${ecs_task_api_container_cpu},
          "memory": ${ecs_task_api_container_mem},
          "portMappings": [
               {
                    "hostPort": ${ecs_task_api_container_port}
                    "containerPort": ${ecs_task_api_container_port},
                    "protocol": "tcp"
               }
          ],
          "environment": [
               { "name": "TZ", "value" : "Asia/Seoul"},
               { "name": "SPRING_PROFILES_ACTIVE", "value" : "stage"}
          ],
          "essential": ${ecs_task_api_essential},
          "mountPoints": [
               {
                    "sourceVolume": "core-shared-volume",
                    "containerPath": "/data/",
                    "readOnly": false
               }
          ],
          "volumesFrom": [],
          "linuxParameters": {
               "capabilities": {
                    "add": [],
                    "drop": []
               }
          },
          "disableNetworking": false,
          "privileged": false,
          "readonlyRootFilesystem": false,
          "pseudoTerminal": false,
          "dockerLabels": {
               "map-migrated": "d-server-00pq62lmigxr9w",
               "createby": "ymkim",
               "teamtag": "AG",
               "env": "${ecs_task_environment}",
               "Name": "${ecs_task_api_container_name}-${ecs_task_api_environment}",
               "servicetag": "search-w-d"
          },
          "healthCheck": {
               "command": [
                    "CMD-SHELL",
                    "${ecs_task_api_container_health_check_url}"
               ],
               "interval": ${ecs_task_api_container_interval},
               "timeout": ${ecs_task_api_container_timeout},
               "retries": ${ecs_task_api_container_retries}
          },
          "systemControls": []
     }
]