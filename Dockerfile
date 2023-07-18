FROM eclipse-temurin:latest
ENV JAVA_OPTS "-Xmx1g -Xms1g"
ENV region=europe
ENV subregion=sweden
RUN apt-get install -y wget
RUN apt-get update
RUN apt-get install -y vim
WORKDIR /graphhopper
EXPOSE 8989
COPY config.yml .
COPY gh.sh .
COPY import.sh .
RUN chmod +x gh.sh

RUN wget https://repo1.maven.org/maven2/com/graphhopper/graphhopper-web/7.0/graphhopper-web-7.0.jar 
RUN /graphhopper/import.sh ${region} ${subregion}

CMD /graphhopper/gh.sh ${region} ${subregion}