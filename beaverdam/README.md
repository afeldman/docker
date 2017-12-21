# docker_beaverdam

beaverdam is a tool to give labels for deeplearning into motion pictures [for more information read](https://github.com/antingshen/BeaverDam).

I provide a docker-compose file for easy building and access.

```bash
docker run -p 5000 -e "PORT=5000" -e "AWS_ID=\"AKIAAAAYOURIDHER" -e "AWS_KEY=\"YOURmturkKEYhere5DyUrkm/81SRSMG+5174\"" -e "DISPLAY=unix$DISPLAY" -v /home/$USER:/home/$USER -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /etc/sudoers.d:/etc/sudoers.d:ro -v /tmp/.X11-unix:/tmp/.X11-unix -w $DOCKER_WORK_DIR -u $DOCKER_USER serve docker_beaverdam
```

I recomand use docker-compose.