FROM alpine/curl:8.2.1 as buildtool

LABEL authors="Vladimir <opa_oz> Levin"
LABEL org.opencontainer.image.source="https://github.com/yakubique/minio-ci-container/blob/main/Dockerfile"

ENV DEBIAN_FRONTEND noninteractive
ENV TZ "Europe/Moscow"

RUN curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o /minio-binaries/mc
RUN chmod +x /minio-binaries/mc

FROM alpine/curl:8.2.1
COPY --from=buildtool / /

ENV HOME /root
ENV PATH="${PATH}:/minio-binaries/"
