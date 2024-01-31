FROM centos:7

RUN yum update -y && yum upgrade -y && yum install -y initscripts \
    wget \
    httpd \
    curl \
    cronie \
    ca-certificates \
    openssl \
    openssh \
    git \
    php \
    php-cli \
    php-json \
    php-iconv \
    nano \
    curl-devel \
    expat-devel \
    gettext-devel \
    openssl-devel \
    zlib-devel \
    pcre-devel \
    gcc \
    gcc-c++ \
    kernel-devel \
    bind \
    bind bind-utils \
    && yum clean -y all && yum makecache

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && \
    composer clear-cache

RUN wget http://repos.1c-bitrix.ru/yum/bitrix-env.sh && chmod +x bitrix-env.sh

ENV container docker

EXPOSE 80
EXPOSE 443