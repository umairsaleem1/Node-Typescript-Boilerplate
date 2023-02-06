FROM node
WORKDIR /app
COPY package.json .

ARG NODE_ENV
RUN if [ "$NODE_ENV" = 'development' ]; \
    then npm install; \
    else npm install --only=production; \
    fi

COPY . .
EXPOSE 8000
CMD ["node","build/src/index.js"]