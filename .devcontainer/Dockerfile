# [Choice] PHP version (use -bullseye variants on local arm64/Apple Silicon): 8, 8.1, 8.0, 7, 7.4, 7.3, 8-bullseye, 8.1-bullseye, 8.0-bullseye, 7-bullseye, 7.4-bullseye, 7.3-bullseye, 8-buster, 8.1-buster, 8.0-buster, 7-buster, 7.4-buster
ARG VARIANT=8-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/php:0-${VARIANT}

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add - \
    && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list \
    && apt-get update \
    && apt-get install -y mongodb-mongosh mongodb-org-tools

# Install Go and Go MongoDB drivers
RUN export DEBIAN_FRONTEND=noninteractive \
    && curl -OL https://dl.google.com/go/go1.19.2.linux-amd64.tar.gz \
    && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.2.linux-amd64.tar.gz \
    && rm go1.19.2.linux-amd64.tar.gz \
    && export GOROOT=/usr/local/go \
    && export GOPATH=/workspace/lessions/5.4 \
    && export PATH=$GOPATH/bin:$GOROOT/bin:$PATH \
    #&& cd /workspaces/introduction-to-mongodb-4315215/lessons/5.4 && go get go.mongodb.org/mongo-driver/mongo \
    && go install -v golang.org/x/tools/gopls@latest

#golang-gopkg-mgo.v2-dev

# Install Python and Python MongoDB drivers
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt -y install --no-install-recommends python3 && apt -y install python3-pip \
    && python3 -m pip install 'pymongo[srv]' \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*
#python3-pymongo

# Install MongoDB PHP drivers and enable extention
RUN export DEBIAN_FRONTEND=noninteractive \
    && pecl install mongodb && docker-php-ext-enable mongodb
#php-mongodb    

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1
