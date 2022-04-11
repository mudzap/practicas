#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
source "/abb_ws/devel_isolated/setup.bash"
exec "$@"
