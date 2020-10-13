#
# Copyright 2016 Confluent Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Builds a docker image for Kafka Connect

FROM confluentinc/cp-kafka-connect-base:6.0.0
ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components"

RUN echo "===> Installing JDBC drivers..." \
    && apt-get -qq update \
    && apt-get install vim

#RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.0.0

ADD etc/kafka-connect-jdbc-10.1.0-SNAPSHOT.jar /usr/share/confluent-hub-components/lib/kafka-connect-jdbc-10.1.0-SNAPSHOT.jar
ADD etc/mysql-connector-java-8.0.21.jar /usr/share/confluent-hub-components/lib/mysql-connector-java-8.0.21.jar
ADD etc/ifxdbc-4.50.4.1.jar /usr/share/confluent-hub-components/lib/ifxdbc-4.50.4.1.jar

#RUN echo "===> Installing GCS Sink Connector ..."
#RUN confluent-hub install confluentinc/kafka-connect-gcs:latest --no-prompt