#---------------------------------------------------------------------
# BUILDER IMAGE
#---------------------------------------------------------------------
ARG BASE_IMAGE=ubuntu:focal
FROM $BASE_IMAGE as builder

RUN apt-get update && apt install wget git net-tools -y

RUN wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz && tar -xvf go1.14.4.linux-amd64.tar.gz && mv go /usr/local
ENV GOROOT=/usr/local/go
RUN mkdir goproject
ENV GOPATH=/goproject
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN git clone https://github.com/AbdallahRustom/5grantestercode.git

RUN cd /5grantestercode \
    && go mod download \
    && cd cmd && go build -o app

#---------------------------------------------------------------------
# TARGET IMAGE
#---------------------------------------------------------------------
ARG BASE_IMAGE=ubuntu:focal
FROM $BASE_IMAGE AS my5grantester

RUN apt update && apt install iproute2 iputils-ping iperf3 net-tools -y

WORKDIR /usr/local
COPY --from=builder /usr/local/go .
ENV GOROOT=/usr/local/go
RUN mkdir goproject
ENV GOPATH=/goproject
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN echo 5
WORKDIR /5grantestercode/config/
COPY --from=builder /5grantestercode/docker/config.yml .
COPY ./config.yml ./config.yml

WORKDIR /5grantestercode/cmd
COPY --from=builder /5grantestercode/cmd/app .
COPY --from=builder /5grantestercode/docker/entrypoint.sh .
COPY ./init.sh ./init.sh

CMD /5grantestercode/cmd/init.sh
