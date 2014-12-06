FROM macool/baseimage-rbenv-docker:latest

# Update rbenv and ruby-build definitions
RUN bash -c 'cd /root/.rbenv && git pull'
RUN bash -c 'cd /root/.rbenv/plugins/ruby-build && git pull'

# Install ruby and gems
RUN rbenv install 2.1.4
RUN rbenv global 2.1.4

RUN echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

RUN gem install bundler
RUN rbenv rehash

# update sources
RUN apt-get -qqy update

# make sure we have libmysqlclient-dev
RUN apt-get install -qqy libmysqlclient-dev

# install mysql-client (will be used by `db:create` task)
RUN apt-get install -qqy mysql-client

# clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# set $HOME
RUN echo "/root" > /etc/container_environment/HOME
# and workdir
RUN mkdir /trade-tariff-admin
WORKDIR /trade-tariff-admin

# let's copy and bundle admin
ADD . /trade-tariff-admin
RUN bundle install

# script that will update backend's IP
RUN mkdir -p /etc/my_init.d
ADD backend_ip.sh /etc/my_init.d/backend_ip.sh
RUN chmod +x /etc/my_init.d/backend_ip.sh
