if $3
then
    echo "FORECE" 
    ls
    rm -f latest.osm.pbf
    rm -drf /graphhopper/graph-cache/*
fi
if [ -f /graphhopper/graph-cache/properties ]
then
    echo "Using existing data" 
else
    echo "Download http://download.geofabrik.de/$1/$2-latest.osm.pbf" 
    wget -O latest.osm.pbf http://download.geofabrik.de/$1/$2-latest.osm.pbf 
fi
java -Ddw.graphhopper.datareader.file=latest.osm.pbf -jar *.jar server config.yml
