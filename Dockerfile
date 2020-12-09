FROM node:alpine3.12

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN  apk add --no-cache  git xdg-utils\
    && mkdir /pixiv\
    && git clone --depth=1 https://github.com/LoveLiveSunshine/pixiv.moe /pixiv\
    && cd pixiv\
#    && npm install -g yarn\
    && yarn install
#    && apk clean

RUN sed -i  's|const OpenBrowserPlugin|//const OpenBrowserPlugin|g'  /pixiv/build/webpack.config.dev.ts
RUN sed -i  's|new OpenBrowserPlugin|//new OpenBrowserPlugin|g'  /pixiv/build/webpack.config.dev.ts
WORKDIR /pixiv
CMD ["npm","start"]