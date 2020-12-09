FROM node:alpine3.12

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN  apk add --no-cache  git\
    && mkdir /pixiv\
    && git clone --depth=1 https://github.com/LoveLiveSunshine/pixiv.moe /pixiv\
    && cd pixiv\
#    && npm install -g yarn\
    && yarn
#    && apk clean
WORKDIR /pixiv
CMD ["npm","start"]