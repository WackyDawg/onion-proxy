FROM ubuntu:20.04

# Avoid interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install Node.js 16 (official way)
RUN apt-get update && apt-get install -y curl gnupg wget dpkg \
  && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs

# Install libssl1.1
RUN apt-get update && apt-get install -y libssl1.1

# Set up app
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

CMD ["node", "test.js"]
