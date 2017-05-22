# set base image
FROM ruby:2.4.1-slim

# install packages for building application
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      git \
      curl \
      wget \
      tar \
      ca-certificates \
      libpq-dev \
      nodejs \
      mysql-client \
      libmysqlclient-dev \
      imagemagick && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# add system user and make directory for application
RUN useradd -m -s/bin/bash rails && \
  mkdir -p /var/www/app && \
  chown rails:rails /var/www/app

# change user
USER rails

WORKDIR /var/www/appp

CMD ["/bin/bash"]
