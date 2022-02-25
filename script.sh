#!/bin/bash
echo "Graphhopper Sweden"
wget https://github.com/graphhopper/graphhopper/releases/download/4.0/graphhopper-web-4.0.jar https://raw.githubusercontent.com/lundopendata/graphhopper/master/config.yml http://download.geofabrik.de/europe/germany/berlin-latest.osm.pbf
wget -O latest.osm.pbf http://download.geofabrik.de/$1-latest.osm.pbf 
java -Ddw.graphhopper.datareader.file=latest.osm.pbf -jar *.jar server config.yml

