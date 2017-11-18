FROM nginx:latest

# image nginx-np
MAINTAINER Sajjad Rahnama <sajjad.rahnama7@gmail.com>
RUN apt-get update && apt-get install -y software-properties-common gnupg

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" > /etc/apt/sources.list.d/ondrej-php.list \
    && echo "deb http://ppa.launchpad.net/ondrej/php-qa/ubuntu xenial main" > /etc/apt/sources.list.d/ondrej-php-qa.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C 2> /dev/null \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        build-essential \
        curl \
        vim \
        git \
        openssh-client \
        ca-certificates \
        php7.1 \
        php7.1-cli \
        php7.1-curl \
        php-apcu \
        php-apcu-bc \
        php7.1-json \
        php-libsodium \
        php7.1-opcache \
        php7.1-readline \
        php7.1-xml \
        php7.1-zip \
        php7.1-fpm \
        php7.1-common \
        php7.1-mbstring\
        php7.1-gd \
        php7.1-mysql \
        php7.1-mongodb \
        php7.1-mcrypt \

    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm \
    && npm install -g gulp \
    && npm install -g @angular/cli \
    && npm install -g bower \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer


RUN mkdir -p /etc/nginx/vhosts.d/
RUN mkdir -p /home/nginx/
RUN mkdir -p /var/run/php/



COPY nginx.conf /etc/nginx/
COPY php_listen.conf /etc/nginx/
COPY fpm.conf /etc/php/7.1/fpm/pool.d/www.conf
COPY run.sh /usr/local/sbin/

RUN chmod +x /usr/local/sbin/run.sh


EXPOSE 80

CMD ["run.sh"]
