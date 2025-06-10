FROM node:16-bullseye

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
COPY . .

# Install libssl1.1 manually from Debian
RUN apt-get update && apt-get install -y wget dpkg \
    && wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb11u5_amd64.deb \
    && dpkg -i libssl1.1_1.1.1n-0+deb11u5_amd64.deb \
    && rm libssl1.1_1.1.1n-0+deb11u5_amd64.deb

CMD ["node", "test.js"]
