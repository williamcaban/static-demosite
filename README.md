# static-demosite

# BUILD
docker build -t demo-nginx .

# RUN
docker run -tid -P --rm --name my-demo demo-nginx

# TAG
docker tag demo-nginx:latest demo-nginx:1-demo
