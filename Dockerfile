FROM node:alpine as builder

RUN mkdir -p /usr/src/app
COPY . /usr/src/app

# Set working dir
WORKDIR /usr/src/app


RUN npm install -g @oracle/ojet-cli

RUN npm install
RUN ojet build

# STEP 2 build a small nginx image with static websiteFROM nginx:alpine## Remove default nginx websiteRUN rm -rf /usr/share/nginx/html/*## From 'builder' copy website to default nginx public folder
FROM nginx:alpine
COPY --from=builder /usr/src/app/web /usr/share/nginx/html/customer
EXPOSE 80
