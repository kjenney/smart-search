FROM ruby:3.1.0

## Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs mariadb-client netcat net-tools vim
RUN gem install bundler

RUN gem install rails -v 7.0.4
RUN rails new myapp -d mysql

WORKDIR /myapp

# Add rails files
COPY rails/ ./

# Add csv for import
COPY *.csv ./

# Add a script to be executed every time the container starts.
RUN mv entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
