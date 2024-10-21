FROM bitnami/spark:3.5.0

USER root

# Install prerequisites
RUN apt-get update && apt-get install -y curl

# Download JAR files
RUN curl -O https://repo1.maven.org/maven2/software/amazon/awssdk/s3/2.18.41/s3-2.18.41.jar \
    && curl -O https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/1.12.367/aws-java-sdk-1.12.367.jar \
    && curl -O https://repo1.maven.org/maven2/io/delta/delta-spark_2.13/3.2.0/delta-spark_2.12-3.2.0.jar \
    && curl -O https://repo1.maven.org/maven2/io/delta/delta-storage/3.2.0/delta-storage-3.2.0.jar

# Move JAR files to Spark jars directory
RUN mv s3-2.18.41.jar \
       aws-java-sdk-1.12.367.jar \
       delta-spark_2.12-3.2.0.jar \
       delta-storage-3.2.0.jar \
       /opt/bitnami/spark/jars/