<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->

# SFTP
<a name="readme-top"></a>
Lightweight, Debian-based sftp server ready-made for Docker deployment. 
Includes basic user authentication


<!-- ABOUT THE PROJECT -->
## About The Project

For portable, standalone SFTP server with basic user authentication and security with dedicated drives.
Allows direct SSH and TLS connections. 

As the entire build is containerized with Docker, this service can be build anywhere with a Docker or Kubernetes, including Raspberry Pis

Includes template rules for IP whitelisting / rate limiting for `iptables`.

### Note
* Review iptable settings and user authentication before exposing this service on a network, or hosting.

### Install
* First clone the repository
```
git clone https://DevinWhitten/sftp.git
```
* specify service in docker-compose.yaml

```
  sftp:
    build:
      context: ./sftp
      args:
        SSH_MASTER_USER: ${SSH_MASTER_USER}
        SSH_MASTER_PASS: ${SSH_MASTER_PASS}
    environment:
      - SSH_MASTER_USER=${SSH_MASTER_USER}
      - SSH_MASTER_PASS=${SSH_MASTER_PASS}
    # tty: true

    ports:
      - "2222:22"
    volumes:
      - /d/data/sftp/:/uploads
```

* Build
```
docker compose build sftp
```

# Run
```
docker compose up -d sftp
```

# SSH
```
ssh <username>@localhost -p <port>
```



Project Link: [https://github.com/DevinWhitten/sftp](https://github.com/DevinWhitten/sftp)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


