FROM golang:alpine AS builder

WORKDIR /app

COPY . .
RUN go build main.go

CMD ["./main"]

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .
CMD ["./main"]