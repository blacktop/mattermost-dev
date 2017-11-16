FROM node:alpine

LABEL maintainer "https://github.com/blacktop"

RUN apk add --no-cache vim git

RUN apk add --no-cache --virtual .build-deps git build-base \
  && git clone https://github.com/mattermost/mattermost-webapp.git /mattermost/mattermost-webapp \
  && cd /mattermost/mattermost-webapp \
  && make build || true \
  && apk del .build-deps

COPY vimrc /root/.vimrc

RUN apk add --no-cache vim
RUN apk add --no-cache --virtual .build-deps curl \
  && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  && yarn add --dev eslint babel-eslint eslint-plugin-react \
  && yarn add --dev prettier eslint-config-prettier eslint-plugin-prettier \
  && vim +PluginInstall +qall \
  && apk del .build-deps

WORKDIR /mattermost/mattermost-webapp

ENV TERM=screen-256color

# Setup Language Environtment
ENV LANG="C.UTF-8"
ENV LC_COLLATE="C.UTF-8"
ENV LC_CTYPE="C.UTF-8"
ENV LC_MESSAGES="C.UTF-8"
ENV LC_MONETARY="C.UTF-8"
ENV LC_NUMERIC="C.UTF-8"
ENV LC_TIME="C.UTF-8"

ENTRYPOINT ["sh"]
