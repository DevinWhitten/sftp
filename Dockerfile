FROM debian:9.5
 
ARG SSH_MASTER_USER
ARG SSH_MASTER_PASS


RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    nano \
    sudo \
    openssh-server \
    vim \
    iptables\
    iptables-persistent

COPY ssh_config /etc/ssh/ssh_config
COPY sshd_config /etc/ssh/sshd_config
COPY rules.v4 /etc/iptables/rules.v4
 
COPY users.sh /usr/local/bin/users.sh
RUN chmod +x /usr/local/bin/users.sh
RUN /usr/local/bin/users.sh
RUN rm /usr/local/bin/users.sh
 
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
 
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
 
CMD tail -f /dev/null