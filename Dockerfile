FROM alpine

ARG DEMO_VERSION="1.0"

LABEL maintainer="William Caban" \
      version="${DEMO_VERSION}" \
      name="Demo Site" \
      vendor="Demo Inc" \
      io.k8s.display-name="Static Demo Site" \
      io.k8s.description="The goal of this image is to be used for demos" \
      io.openshift.expose-services="8080,nginx" \
      io.openshift.tags="nginx" \
      summary="This is a static demosite" \
      release="3"

RUN apk add --no-cache --update nginx
RUN adduser -D -u 1000 -g 'www' www && chown -R www:www /var/lib/nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY demosite /var/lib/nginx/html

EXPOSE 8080

CMD ["nginx","-g","daemon off;"]
