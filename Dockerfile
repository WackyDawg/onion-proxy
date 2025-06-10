FROM node:16-bullseye

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
COPY . .

# Install dependencies for wget and dpkg
RUN apt-get update && apt-get install -y wget dpkg \
    && wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb \
    && dpkg -i libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb \
    && rm libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb

CMD ["node", "test.js"]