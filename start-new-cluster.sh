#!/bin/bash

uuid=$(/kafka/bin/kafka-storage.sh random-uuid);

/kafka/bin/kafka-storage.sh format -t $uuid -c /kafka/config/server.properties

/kafka/bin/kafka-server-start.sh /kafka/config/server.properties
