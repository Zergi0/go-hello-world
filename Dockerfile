FROM golang:1.25.1-alpine3.22
WORKDIR /server
COPY . .
ENTRYPOINT [ "go", "build", "server.go" ]
