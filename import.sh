echo "Download http://download.geofabrik.de/$1/$2-latest.osm.pbf" 
wget -O latest.osm.pbf http://download.geofabrik.de/$1/$2-latest.osm.pbf 
java -Ddw.graphhopper.datareader.file=latest.osm.pbf -jar *.jar import config.yml