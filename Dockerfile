# 使用官方 PHP 镜像 + Apache
FROM php:8.1-apache

# 安装必要扩展
RUN apt-get update && apt-get install -y \
    libzip-dev unzip curl && \
    docker-php-ext-install zip && \
    docker-php-ext-install opcache && \
    pecl install apcu && docker-php-ext-enable apcu

# 启用 mod_rewrite（如果有路由需求）
RUN a2enmod rewrite

# 设置时区
ENV TZ=Asia/Shanghai

# 设置文档根目录
COPY public/ /var/www/html/

# 权限修复
RUN chown -R www-data:www-data /var/www/html
