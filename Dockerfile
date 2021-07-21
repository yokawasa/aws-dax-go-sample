## multi-stage build for aws-dax-go-sample
# Binary build
FROM golang:1.16.4-buster as builder
RUN apt update && apt install -y --no-install-recommends git tzdata
WORKDIR /go/src/github.com/aws-samples/aws-dax-go-sample
ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64
COPY . .
RUN GO111MODULE=on go build

# Runtime environment
FROM debian:10.3-slim as executor
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
WORKDIR /
COPY --from=builder /go/src/github.com/aws-samples/aws-dax-go-sample/aws-dax-go-sample /aws-dax-go-sample
ENTRYPOINT ["/aws-dax-go-sample"]
