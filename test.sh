skdir -p -/setup-display && cd -/setup-display
cat > docker-compose.yml <<EOF
services:
  display:
     image: ghcr.io/dtinth/stigervnc-docker:main
     tmpfs: /tmp
     restart: always
     enviroment:
       VNC_GEOMETRY: 1440x900
     ports:
       -  127.0.0.1:5900:5900
       -  127.0.0.1:6000:6000

     novnc:
      image: geek1011/easy-novnc
      restart: always
      command: -a :5800 -h display --no-url-password
      ports:
	- 127.0.0.1:%800-5800
  EOF
  docker compose up -d
      
