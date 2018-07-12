FROM maven
WORKDIR /opt
RUN git clone https://github.com/fknbwdwn/PretendYoureXyzzy.git
WORKDIR PretendYoureXyzzy
RUN wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz && gunzip GeoLite2-City.mmdb.gz 
RUN mvn clean package war:exploded -Dmaven.buildNumber.doCheck=false -Dmaven.buildNumber.doUpdate=false
EXPOSE 8080
CMD mvn jetty:run
