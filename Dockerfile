FROM node:alpine

LABEL maintainer "https://github.com/blacktop"

ENV TERM=screen-256color

# Setup Language Environtment
ENV LANG="C.UTF-8"
ENV LC_COLLATE="C.UTF-8"
ENV LC_CTYPE="C.UTF-8"
ENV LC_MESSAGES="C.UTF-8"
ENV LC_MONETARY="C.UTF-8"
ENV LC_NUMERIC="C.UTF-8"
ENV LC_TIME="C.UTF-8"

RUN apk add --no-cache vim git zsh

# Install mattermost-webapp
RUN apk add --no-cache --virtual .build-deps git build-base \
  && git clone https://github.com/mattermost/mattermost-webapp.git /mattermost/mattermost-webapp \
  && cd /mattermost/mattermost-webapp \
  && make build || true \
  && git clone https://github.com/mattermost/mattermost-redux.git /mattermost/mattermost-redux \
  && cd /mattermost/mattermost-redux \
  && make install || true \
  && apk del .build-deps

# Install vim plugins
RUN git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
RUN git clone https://github.com/pangloss/vim-javascript.git ~/.vim/pack/plugins/start/vim-javascript
RUN git clone https://github.com/mxw/vim-jsx.git ~/.vim/pack/plugins/start/vim-jsx
RUN git clone https://github.com/mattn/emmet-vim.git ~/.vim/pack/plugins/start/emmet-vim
RUN git clone https://github.com/w0rp/ale.git ~/.vim/pack/plugins/start/ale
RUN git clone https://github.com/skywind3000/asyncrun.vim.git ~/.vim/pack/plugins/start/asyncrun.vim
RUN git clone https://github.com/leshill/vim-json.git ~/.vim/pack/plugins/start/vim-json
RUN git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline.vim
RUN git clone https://github.com/jacoborus/tender.vim.git ~/.vim/pack/plugins/start/tender \
  && mkdir -p ~/.vim/colors \
  && cp ~/.vim/pack/plugins/start/tender/colors/tender.vim ~/.vim/colors/tender.vim
# Install vim plugins
RUN yarn add --dev eslint babel-eslint eslint-plugin-react
RUN yarn add --dev prettier eslint-config-prettier eslint-plugin-prettier

# Install oh-my-zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

COPY vimrc /root/.vimrc
COPY zshrc /root/.zshrc

WORKDIR /mattermost/mattermost-webapp

ENTRYPOINT ["zsh"]
