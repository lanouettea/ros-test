#! /bin/bash

docker-compose -f docker-compose.container-host-hostnet.yml up &

ros2 run demo_nodes_py listener

docker-compose -f docker-compose.container-host-hostnet.yml down
