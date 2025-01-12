FROM openjdk:17-jdk-alpine
RUN apk add --no-cache curl zip bash
RUN curl -s "https://get.sdkman.io" | bash
RUN chmod +x /root/.sdkman/bin/sdkman-init.sh && /root/.sdkman/bin/sdkman-init.sh && \
    /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install gradle"
WORKDIR /app
COPY . .
EXPOSE 8081
CMD ["java", "-jar", "build/libs/GYMFIT-0.0.1-SNAPSHOT.jar"]