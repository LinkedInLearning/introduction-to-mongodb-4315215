# add alias for mongo client which is no longer available
echo alias mongo="\"echo -e '\\n>> NOTE: 📣📣 Use the \033[1mmongosh\033[0m command instead! 📣📣\\n'\"" >> ~/.bashrc
# start up mongosh without warnings
echo alias mongosh="mongosh --quiet"

# remove some warnings
mongosh --eval "disableTelemetry()"
mongosh --eval "db.disableFreeMonitoring()"

# install drivers
sh mongodb-go-drivers.sh
sh mongodb-node-drivers.sh

# import example data
sh import-examples.sh
