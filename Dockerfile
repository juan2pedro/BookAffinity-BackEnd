FROM node:alpine
WORKDIR /usr/app
COPY ["package.json", "package-lock.json", "tsconfig.json", ".env", "./"]
COPY ./src ./src
RUN npm install
CMD npm run deploy