FROM golang:latest AS build
WORKDIR /home/app
COPY src/ .
RUN go mod init lvsena/go-fc
RUN go build main.go


FROM scratch
COPY --from=build /home/app/main .
ENTRYPOINT [ "/main" ]