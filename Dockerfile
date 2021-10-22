FROM golang:1.16.9 as build 
WORKDIR /go/src 
COPY . . 
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /src
FROM scratch
COPY --from=build /src /src
ENTRYPOINT ["/src"]
