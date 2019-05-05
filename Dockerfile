# Usando uma imagem do ruby 
FROM ruby:2.5.0-slim

MAINTAINER Bruno Batista <brunobatista@gmail.com>

# Instalando dependências
RUN apt-get update && \
    apt-get install -y gnupg build-essential

ENV APP_HOME /app \
    HOME /root
# Criando a pasta app
WORKDIR $APP_HOME
# Copiando o Gemfile pra pasta app
COPY Gemfile* $APP_HOME/

#instalando a gem bundler e rodando
RUN gem install bundle && bundle install

# Copiando o projeto para pasta app
COPY . $APP_HOME

# Colocando o comando default
CMD bundle exec rspec
