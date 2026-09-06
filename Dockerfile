FROM golang:1.27.1-bookworm as build
WORKDIR /go/src
COPY . .
RUN go build -o /go/bin/app ./cmd/main.go

FROM gcr.io/distroless/base-debian12
ENV TZ="Asia/Tokyo"
COPY --from=build /go/bin/app /
CMD ["/app"]
