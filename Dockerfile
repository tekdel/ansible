FROM archlinux:latest
WORKDIR /app
COPY . /app

CMD ["resources/setup"]
