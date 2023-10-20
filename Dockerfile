FROM golang:1.21 as builder

WORKDIR /usr/src/app

COPY ./src/hello.go ./

RUN go build -v -o /usr/local/bin/app hello.go

FROM scratch

COPY --from=builder /usr/local/bin/app /usr/local/bin/app

ENTRYPOINT ["/usr/local/bin/app"]