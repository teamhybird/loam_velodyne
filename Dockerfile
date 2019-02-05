FROM ros:kinetic-ros-core

RUN apt-get -qq update \
    && apt-get install -y libpcl-dev

COPY package.xml /home/catkin_ws/src/loam_velodyne/package.xml

RUN rosdep install --as-root apt:yes -r --from-paths /home/catkin_ws/ --ignore-src --rosdistro kinetic -y 

COPY . /home/catkin_ws/src/loam_velodyne/

SHELL ["bin/bash", "-c"]

RUN source /opt/ros/kinetic/setup.bash \
    && cd /home/catkin_ws/ \
    && catkin_make

CMD cd /home/catkin_ws \
    && source devel/setup.bash \
    && sleep 5 \
    && roslaunch loam_velodyne hector_loam_velodyne.launch

    