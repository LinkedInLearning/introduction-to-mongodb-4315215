# add alias for mongo client which is no longer available
echo alias mongo='echo -e "📣📣 Use the \033[1mmongosh\033[0m command instead!" 📣📣' >> ~/.bashrc

# remove some warnings
mongosh --eval "disableTelemetry()"
mongosh --eval "db.disableFreeMonitoring()"

# install drivers
sh mongodb-go-drivers.sh
sh mongodb-node-drivers.sh

# import example data
sh import-examples.sh
