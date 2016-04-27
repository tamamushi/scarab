FROM centos:centos6.7

ENV APP_HOME /app

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle install
ADD . $APP_HOME

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s"]
