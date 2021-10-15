# ros-test
Test repository to check ROS communication between a docker host and a container using the demo_nodes_py ROS executable

## Pre-requisites:
To run any exemples involving ROS communication with the host, ROS Foxy needs to be installed on the host computer.
Assuming the host is an ubuntu instance, make sure you installed the following packages:
- ros-foxy-base
- ros-foxy-demo-nodes-py

Full instructions on how to setup the required deb repositories to install those packages can be found in [the official RoS Foxy documentation](https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html). 

# Communication tests

## Container <-> Container

In this test, the 2 ROS nodes are hosted in 2 separate Docker container, each running in the same Docker network. 

Run the following command: 

```
./test-container-container.sh
```

You should see the "talker" container publish messages with an incrementing counter, and the "listener" container indicating that it heard each messages, sequentially.

## Container <-> Host, using the default ROS Foxy DDS ([Fast DDS](https://www.eprosima.com/index.php/products-all/eprosima-fast-dds))
In this test, one of the RoS node is ran on the Docker host directly, while the other is ran inside a Docker container. 

Run the following command in a terminal:

```
./test-container-host_fastdds.sh
```

You should see the sequential messages being published by the `ros-foxy-talker_1` Docker container and the same sequential messages as read from the Docker host, interlaced with them.

---
**NOTE**

**_At the time of writing this exemple, this test setup does not work on my system (Ubuntu 20.04 in WSL2 on Windows 11 host), Docker-Desktop with WSL2 integration enabled)._**

---

## Container <-> Host, using Cyclone DDS
In this test, one of the RoS node is ran on the Docker host directly, while the other is ran inside a Docker container. 

Edit the script `test-container-host_cyclone_.sh` and set the value of the `HOST_IP` variable to the IP of your Docker host.

Then, run the following command in a terminal:

```
./test-container-host_cyclone_.sh
```

You should see the sequential messages being published by the `ros-foxy-talker_1` Docker container and the same sequential messages as read from the Docker host, interlaced with them.

---
**NOTE**

**_At the time of writing this exemple, this test setup does not work on my system (Ubuntu 20.04 in WSL2 on Windows 11 host), Docker-Desktop with WSL2 integration enabled)._**

---

## Container <-> Host, using using the default ROS Foxy DDS ([Fast DDS](https://www.eprosima.com/index.php/products-all/eprosima-fast-dds)), without container network isolation
In this test, one of the RoS node is ran on the Docker host directly, while the other is ran inside a Docker container. However, the network isolation usually present with Docker container is disabled by setting the docker --network=host instruction. This means that ports exposed inside the Docker container are systematically exposed on the Host. 

Run the following command in a terminal:

```
./test-container-host_host_.sh
```

You should see the sequential messages being published by the `ros-foxy-talker_1` Docker container and the same sequential messages as read from the Docker host, interlaced with them.

---
**NOTE**

**_At the time of writing this exemple, this test setup does not work on my system (Ubuntu 20.04 in WSL2 on Windows 11 host), Docker-Desktop with WSL2 integration enabled)._**

---