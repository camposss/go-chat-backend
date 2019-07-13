FROM golang as builder
ENV GO111MODULE=on

RUN mkdir /app
WORKDIR /app
COPY . .
RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main

FROM scratch

COPY --from=builder /app/main /app/main

CMD ["/app/main"]

