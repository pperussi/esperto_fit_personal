FROM ruby:2.6.4
RUN apt-get update -qq && apt-get install -y postgresql-client 
RUN mkdir /espertofit_personal
WORKDIR /espertofit_personal
COPY Gemfile /espertofit_personal/Gemfile
COPY Gemfile.lock /espertofit_personal/Gemfile.lock
RUN bundle install
RUN rails db:setup
COPY . /espertofit_personal

# Add a script to be executed every time the container starts.
EXPOSE 3000

# Start the main process.

CMD ["rails", "server", "-b", "0.0.0.0"]
