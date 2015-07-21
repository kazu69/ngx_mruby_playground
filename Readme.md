### ngx_mruby

- docker
- boot2docker

```sh
# build base images
docker build -t mod_ngx:base base/

docker build -t mod_ngx:build build/

docker run -p 8080:80 -d mod_ngx:build

# basci auth
curl -I --user test:password http://localhost:8080/basic_auth/
HTTP/1.1 200 OK
Server: nginx/1.9.1
Date: Sun, 19 Jul 2015 03:39:09 GMT
Content-Type: text/html
Content-Length: 18
Last-Modified: Sun, 19 Jul 2015 02:38:21 GMT
Connection: keep-alive
ETag: "55ab0d9d-12"
Accept-Ranges: bytes

# cache control

# html
# added max-age=0
# added Expires
curl -I http://localhost:8080/cache_control/
HTTP/1.1 200 OK
Server: nginx/1.9.1
Date: Sun, 19 Jul 2015 03:39:37 GMT
Content-Type: text/html
Content-Length: 258
Last-Modified: Sun, 19 Jul 2015 03:18:15 GMT
Connection: keep-alive
Cache-Control: max-age=0
Expires: Mon, 26 Jul 1997 05:00:00 GMT
ETag: "55ab16f7-102"
Accept-Ranges: bytes

# css, js
# added max-age=600
curl -I http://localhost:8080/cache_control/normalize.css
HTTP/1.1 200 OK
Server: nginx/1.9.1
Date: Sun, 19 Jul 2015 03:40:02 GMT
Content-Type: text/css
Content-Length: 7798
Last-Modified: Sun, 19 Jul 2015 03:17:19 GMT
Connection: keep-alive
Cache-Control: max-age=600
ETag: "55ab16bf-1e76"
Accept-Ranges: bytes

# images
# added max-age=604800
curl -I http://localhost:8080/cache_control/mruby_logo_red_icon.png
HTTP/1.1 200 OK
Server: nginx/1.9.1
Date: Sun, 19 Jul 2015 03:40:39 GMT
Content-Type: image/png
Content-Length: 12224
Last-Modified: Sun, 19 Jul 2015 03:17:44 GMT
Connection: keep-alive
Cache-Control: max-age=604800
ETag: "55ab16d8-2fc0"
Accept-Ranges: bytes
```
