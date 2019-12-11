FROM openjdk:8-jre

ARG PDI=https://vorboss.dl.sourceforge.net/project/pentaho/Pentaho%208.3/client-tools/pdi-ce-8.3.0.0-371.zip
ARG MYSQL_DRIVER=https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-5.1.48.zip

    # Update system
RUN apt-get update && \
    apt-get install -yqq libwebkitgtk-1.0-0 libswt-gtk-3-jni && \

    # Get files
    wget --progress=dot:giga -O /tmp/pdi-ce.zip $PDI && \
    wget --progress=dot:giga -O /tmp/mysql_driver.zip $MYSQL_DRIVER && \

    # Unzip files
    unzip -q /tmp/pdi-ce.zip -d /home/ && \
    unzip -q /tmp/mysql_driver.zip -d /tmp/ && \
    cp /tmp/mysql-connector-java-5.1.48/mysql-connector-java-5.1.48.jar /home/data-integration/lib/ && \

    # Remove unnecesary files
    rm /tmp/pdi-ce.zip && \
    rm -rf /tmp/mysql_driver.zip /tmp/mysql-connector-java-5.1.48/ &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/data-integration/
CMD ./spoon.sh
