FROM ubuntu:latest

ENV KAFKA_VERSION=2.8.0
ENV SCALA_VERSION=2.13
ENV INST_DIR=/tmp/install

RUN apt update && \
    apt install -y openjdk-11-jre-headless curl && \
    mkdir -p /kafka $INST_DIR && \
    curl https://mirror.checkdomain.de/apache/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz -o $INST_DIR/kafka.tgz && \
    tar xfv $INST_DIR/kafka.tgz -C $INST_DIR && \
    mv $INST_DIR/kafka_$SCALA_VERSION-$KAFKA_VERSION/* /kafka && \
    rm -rf $INST_DIR && \
    apt remove -y curl && \
    apt clean all

ADD start-new-cluster.sh /kafka/bin
RUN chmod +x /kafka/bin/start-new-cluster.sh

WORKDIR /kafka

ENTRYPOINT ["/kafka/bin/start-new-cluster.sh"]
