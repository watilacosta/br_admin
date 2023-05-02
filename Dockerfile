FROM ruby:3.2.2-bullseye

RUN apt-get update -qq && apt-get install -y build-essential \
    nodejs \
    yarn \
    postgresql-client \
    libpq-dev \
    graphviz \
    gnupg2 \
    less \
    git \
    libpq-dev \
    libvips \
    curl \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
