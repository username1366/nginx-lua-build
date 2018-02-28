FROM ubuntu as builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    wget git\
    libluajit-5.1-dev \
    libpcre3 \
    libpcre3-dev \
    zlib1g-dev

WORKDIR /opt
RUN git clone --verbose https://github.com/simplresty/ngx_devel_kit.git && cd ngx_devel_kit && \
    git checkout v0.3.1rc1

RUN git clone --verbose https://github.com/openresty/lua-nginx-module.git && cd lua-nginx-module && \
    git checkout v0.10.12rc2

RUN git clone --verbose https://github.com/nginx/nginx.git nginx-src

RUN git clone --verbose https://github.com/LuaJIT/LuaJIT.git && cd LuaJIT && \
    git checkout v2.1.0-beta3 && make && make install

WORKDIR /opt/nginx-src
ADD index.html docs/html/
ADD nginx.conf conf/
RUN ls -l && auto/configure --prefix=/opt/nginx \
    --with-ld-opt="-Wl,-rpath,/usr/local/lib" \
    --add-module=/opt/ngx_devel_kit \
    --add-module=/opt/lua-nginx-module && \
    make -j2 && \
    make install

FROM ubuntu
COPY --from=builder /usr/local/lib /usr/local/lib
COPY --from=builder /opt/nginx /opt/nginx
CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]
