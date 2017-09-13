# docker-nnp
Docker File for Nginx , Php and Nodejs

### Usage

To run it:

    $ docker run -d -p 80:80 -v hosts:/home/nginx/ -v vhosts:/etc/nginx/vhosts.d/ scr12/nginx-np

### Docker Compose

```yaml
version: '3'
services:
    web:
        image: scr12/nginx-np:latest
        ports:
            - "80:80"
        restart: always
        volumes:
            - hosts:/home/nginx/
            - vhosts:/etc/nginx/vhosts.d/
```