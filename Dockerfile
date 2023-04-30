FROM ruby:3.2.2-bullseye

RUN apt-get update -qq && apt-get install -y build-essential \
    postgresql-client \
    libpq-dev \
    graphviz \
    git-core  \
    zlib1g-dev  \
    libssl-dev  \
    libreadline-dev  \
    libyaml-dev  \
    libsqlite3-dev  \
    sqlite3  \
    libxml2-dev  \
    libxslt1-dev  \
    libcurl4-openssl-dev  \
    software-properties-common  \
    libffi-dev

WORKDIR /home/br-admin
COPY Gemfile /home/br-admin/Gemfile
COPY Gemfile.lock /home/br-admin/Gemfile.lock
RUN bundle install

RUN chown -R $USER:$USER .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
