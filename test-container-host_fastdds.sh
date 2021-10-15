#! /bin/bash

docker-compose -f docker-compose.container-host-fastdds.yml up &

ros2 run demo_nodes_py listener

docker-compose -f docker-compose.container-host-fastdds.yml down
