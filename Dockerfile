FROM nginx:1.10.2-alpine

RUN mkdir -p /usr/src/app
COPY . /usr/src/app

# Set working dir
WORKDIR /usr/src/app

RUN npm install -g @oracle/ojet-cli

RUN npm install
RUN ojet build

COPY ./web /usr/share/nginx/html
EXPOSE 80