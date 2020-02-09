FROM golang:alpine AS app
WORKDIR /app
RUN apk add -U git \
    && go get github.com/parkghost/gohttpbench \
    && go build -o gb github.com/parkghost/gohttpbench

FROM alpine
LABEL maintainer 'Michaël "e7d" Ferrand'
COPY --from=app /app/gb /bin/gb
ENTRYPOINT [ "gb" ]
