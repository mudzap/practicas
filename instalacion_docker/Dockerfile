FROM ros:melodic
RUN apt-get update && apt-get install -y \
  --no-install-recommends ros-melodic-vision-opencv git \
  && rm -rf /var/lib/apt/lists/*
 
RUN git clone -b master https://github.com/ros-industrial/abb_robot_driver.git /abb_ws/src/abb && \
  git clone -b master https://github.com/ros-industrial/abb_egm_rws_managers.git abb_ws/src/abb/abb_egm_rws_managers && \
  git clone -b master https://github.com/ros-industrial/abb_librws.git /abb_ws/src/abb/abb_librws && \
  git clone -b master https://github.com/ros-industrial/abb_libegm.git /abb_ws/src/abb/abb_libegm

WORKDIR /abb_ws/

RUN apt-get update && rosdep update && rosdep install -iy --from-paths src
RUN /bin/bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash \
  && catkin_make_isolated"

WORKDIR /
COPY ./my_entrypoint.sh /

ENTRYPOINT ["/my_entrypoint.sh"]
CMD ["bash"]
