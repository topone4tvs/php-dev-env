#!/bin/bash
docker_containers=(developerdocker_php7_1 developerdocker_nginx_1 developerdocker_workspace_1)
container_flag=${docker_containers[0]}

container_name=$1
if [ "$container_name" = "php" ]; then
    container_flag=${docker_containers[0]}
elif [ "$container_name" = "nginx" ]; then
    container_flag=${docker_containers[1]}
elif [ "$container_name" = "workspace" ]; then
    container_flag=${docker_containers[2]}
fi
echo $container_flag
sudo docker exec -it $container_flag sh
