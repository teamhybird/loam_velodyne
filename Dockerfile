FROM hybird/aarch64/loam_velodyne-dep

COPY . /home/catkin_ws/src/loam_velodyne/


SHELL ["bin/bash", "-c"]

RUN source /opt/ros/kinetic/setup.bash \
    && cd /home/catkin_ws/ \
    && catkin_make

CMD cd /home/catkin_ws \
    && source devel/setup.bash \
    && sleep 5 \
    && roslaunch loam_velodyne hector_loam_velodyne.launch

    