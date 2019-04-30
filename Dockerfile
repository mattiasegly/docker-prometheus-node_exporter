#Using stretch because of curl SSL error on buster
FROM balenalib/rpi:stretch AS builder
RUN [ "cross-build-start" ]

ARG OS=linux
ARG ARCH=armv6
ARG PRODUCT=node_exporter
ARG RELEASE=0.17.0

RUN apt-get update && apt-get install -y --no-install-recommends \
	curl \
	tar \
&& rm -rf /var/lib/apt/lists/*

RUN curl -LJ https://github.com/prometheus/$PRODUCT/releases/download/v$RELEASE/$PRODUCT-$RELEASE.$OS-$ARCH.tar.gz -o $PRODUCT.tar.gz && \
	mkdir /extract && \
	tar -xzf $PRODUCT.tar.gz -C /extract --strip-components=1

RUN [ "cross-build-end" ]

FROM balenalib/rpi:buster
RUN [ "cross-build-start" ]

COPY --from=builder /extract /node_exporter
RUN chown -R nobody:nogroup /node_exporter

RUN [ "cross-build-end" ]

EXPOSE 9100
USER nobody

#ENTRYPOINT ["entrypoint.sh"]
CMD ["/node_exporter/node_exporter", "--path.rootfs", "/host"]
