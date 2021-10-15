#! /bin/bash

export HOST_IP=172.18.40.102
export RMW_IMPLEMENTATION="rmw_cyclonedds_cpp"
export CYCLONEDDS_URI="<CycloneDDS><Domain id='any'><General><NetworkInterfaceAddress>${HOST_IP}</NetworkInterfaceAddress><AllowMulticast>false</AllowMulticast></General><Discovery><ParticipantIndex>0</ParticipantIndex><Peers><Peer address='${HOST_IP}'/></Peers></Discovery><Tracing><Verbosity>config</Verbosity><Out>stderr</Out></Tracing></Domain></CycloneDDS>"

docker-compose -f docker-compose.container-host-cyclone.yml up &

ros2 run demo_nodes_py listener

docker-compose -f docker-compose.container-host-cyclone.yml down
