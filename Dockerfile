FROM openjdk:11.0-jre
ENV JAVA_OPTS "-Xmx1g -Xms1g"
ENV region=europe
ENV subregion=sweden
ENV force=false
RUN apt-get install -y wget
RUN apt-get update
RUN apt-get install -y vim
WORKDIR /graphhopper
EXPOSE 8989
COPY config.yml .
COPY gh.sh .
RUN chmod +x gh.sh

RUN wget https://github.com/graphhopper/graphhopper/releases/download/6.0/graphhopper-web-6.0.jar 

CMD /graphhopper/gh.sh ${region} ${subregion} ${force}