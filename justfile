init:
    ./gradlew cleanAll loadAll
load:
    ./gradlew loadAll
start:
    ./gradlew ofbiz
rev:
    # for rest
    git diff -U8 framework/service/src/main/java/org/apache/ofbiz/service/ModelServiceReader.java
    # for postgres
    git diff -U8 framework/entity/config/entityengine.xml
    # for log
    git diff -U8 framework/base/config/debug.properties
    # change <logger name="org.apache.ofbiz" level="all"/> to "warn"
    git diff -U8 framework/base/config/log4j2.xml
    # for rmi: ofbiz.start.loaders=main,rmi
    git diff -U8 framework/start/src/main/resources/org/apache/ofbiz/base/start/start.properties
    git diff -U8 framework/service/config/service.properties
    git diff -U8 framework/service/src/main/java/org/apache/ofbiz/service/rmi/RemoteDispatcher.java
    git diff -U8 framework/service/src/main/java/org/apache/ofbiz/service/rmi/RemoteDispatcherImpl.java
    # disable webapps
    git diff -U8 framework/catalina/ofbiz-component.xml

rev-plug:
    cd plugins && git diff -U8 ofbiz-rest-impl/src/main/java/org/apache/ofbiz/ws/rs/resources/OFBizServiceResource.java

rev-v2:
	git diff -U8 applications/datamodel/entitydef/party-entitymodel.xml

auth:
    curl -k -X POST "https://localhost:8443/rest/auth/token" -H "accept: application/json" -H "Authorization: Basic YWRtaW46b2ZiaXo="

boot:
    java -jar build/libs/ofbiz.jar
rmi:
    java -cp build/libs/ofbiz.jar -Djavax.net.ssl.trustStore=framework/base/config/ofbizrmi-truststore.jks org.apache.ofbiz.service.rmi.ExampleRemoteClient
rmi-port:
    sudo lsof -i -P | grep LISTEN | grep 1099

copy-jar:
	cp build/libs/ofbiz.jar ~/sagas/projs/bluecc-adapter/lib/
jar:
	./gradlew jar
	# cp build/libs/ofbiz.jar ~/sagas/projs/bluecc-adapter/lib/
	cp build/libs/ofbiz.jar ~/sagas/projs/dispat-api/lib/

