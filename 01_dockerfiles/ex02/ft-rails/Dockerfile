FROM ruby

RUN apt-get update && apt-get install -y \
sqlite3 \
build-essential \
libpq-dev \
nodejs && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install yarn

RUN gem install rails

ONBUILD COPY app /opt/app
ONBUILD WORKDIR /opt/app
ONBUILD RUN bundle install
ONBUILD RUN rake db:migrate
ONBUILD RUN rake db:seed

#docker build -t ft-rails:on-build .
