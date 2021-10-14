# ros-test
Test repository to check ROS communication between a docker host and a container using the demo_nodes_py ROS executable


## Communication test: Container <-> Container

Run the following command: 

```
docker-compose -f docker-compose.containers.yml up 
```

You should see the "talker" container publish messages with an incrementing counter, and the "listener" container indicating that it heard each messages, sequentially.

## Communication test: Container <-> Container

### Pre-requisites:
    - Make sur you install the debian packages `ros-foxy-base` and `ros-foxy-demo-nodes-py` on your Docker host.

### Test

Run the following command in a terminal:

```
docker-compose -f docker-compose.container-host.yml up 
```

In another terminal, on your Docker host, execute the following command: 

```
ros2 run demo_nodes_py listener
```

You should see the sequential messages being read by the command you ran on the Docker host.
