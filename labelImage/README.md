# docker_labelImg
[labelImg](https://github.com/tzutalin/labelImg) is a image labeling tool. The docker compose file helps you to build the container.


```bash
docker run -e "DISPLAY=unix$DISPLAY" -v /home/$USER:/home/$USER -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v /etc/sudoers.d:/etc/sudoers.d:ro -v /etc/shadow:/etc/shadow:ro -v /tmp/.X11-unix:/tmp/.X11-unix -w $DOCKER_WORK_DIR -u $DOCKER_USER docker_labelImg
```