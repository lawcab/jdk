This is base from Ubuntu 14:14

This has a VNC server that you can connect to.

It has JDK  and IntelliJ as the ide

to run :

docker run -d -p <port>:5901 -v <local_working_project_directory>:/prj lawcab/jdk /opt/vnc.sh

to connect to vnc open a VNC viewer localhost:<port>
passowrd is test123
