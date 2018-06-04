## Adding Windows Service

Command Format:
sc.exe create {Service Name} binPath={File Path} --config {Config File Path} --service

Example creating a MongoDB Primary Instance service with links to the config file:
sc.exe create MongoDB_Primary binPath= "\"C:\Program Files\MongoDB_Primary\Server\3.0\bin\mongod\" --config \"C:\Program Files\MongoDB_Primary\mongod.cfg\" --service "

## Remove Windows Service

Command Format:
sc stop {Service Name}
sc delete {Service Name}