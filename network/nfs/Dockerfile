FROM afeldman/alpine:latest


#install required
RUN apk add -U -v --no-cache \
    nfs-utils \
    bash\
    iproute2

#clean
RUN rm -f /sbin/halt /sbin/poweroff /sbin/reboot

#build
RUN mkdir -p /var/lib/nfs/rpc_pipefs \
    && mkdir -p /var/lib/nfs/v4recovery

#change fstap
RUN echo "rpc_pipefs    /var/lib/nfs/rpc_pipefs rpc_pipefs      defaults        0       0" >> /etc/fstab \
    && echo "nfsd  /proc/fs/nfsd   nfsd    defaults        0       0" >> /etc/fstab
