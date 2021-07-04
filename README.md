# Docker Image for Kafka with KRaft
Dockerfile to try out a single broker with kraft protocol enabled.

## Usage
### Build
```
$ docker build -t kafka-kraft .
```

### Start
```
$ docker run -d -v $(pwd)/config:/kafka/config -p 9092:9092 kafka-kraft -t kafka-kraft
```
