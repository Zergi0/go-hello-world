FROM golang:1.25.1-alpine3.22 AS builder
WORKDIR /build
COPY . .
RUN go build server.go

FROM golang:1.25.1-alpine3.22 AS runner
WORKDIR /server
COPY --from=builder /build/server .
EXPOSE 5000
ENTRYPOINT [ "./server" ]