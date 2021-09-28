FROM golang:1.8 AS builder
WORKDIR /go/src/github.com/codeship/go-hello-world
COPY hello-world.go .
RUN go build -o hello-world .

CMD ./hello-world

FROM alpine:3.13.6 AS final
WORKDIR /app
COPY --from=builder /go/src/github.com/codeship/go-hello-world/hello-world .

ENTRYPOINT ["./hello-world"]
