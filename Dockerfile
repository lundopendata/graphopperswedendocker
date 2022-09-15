FROM openjdk:11.0-jre
ENV JAVA_OPTS "-Xmx1g -Xms1g"
ENV region=europe
ENV subregion=sweden
ENV config=https://raw.githubusercontent.com/lundopendata/graphhopper/master/config.yml
RUN apt-get install -y wget
RUN apt-get update
RUN apt-get install -y vim
WORKDIR /graphhopper
EXPOSE 8989
RUN wget https://github.com/graphhopper/graphhopper/releases/download/6.0/graphhopper-web-6.0.jar 

CMD rm -rf graph-cache && rm -f latest.osm.pbf && echo "Download http://download.geofabrik.de/${region}/${subregion}-latest.osm.pbf" && wget -O latest.osm.pbf http://download.geofabrik.de/${region}/${subregion}-latest.osm.pbf && wget ${config} && java -Ddw.graphhopper.datareader.file=latest.osm.pbf -jar *.jar server config.yml

