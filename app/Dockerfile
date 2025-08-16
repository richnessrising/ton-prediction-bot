FROM node:18-bullseye
WORKDIR /usr/src/app
COPY package.json package-lock.json* ./
RUN npm install --omit=dev
COPY . .
ENV NODE_ENV=production TZ=Asia/Tehran
EXPOSE 3000
CMD ["node", "src/index.js"]
