# add alias for mongo client which is no longer available
echo alias mongo="\"echo -e '\\n>> NOTE: 📣📣 Use the \033[1mmongosh\033[0m command instead! 📣📣\\n'\"" >> ~/.bashrc
# start up mongosh without warnings
echo alias mongosh="\"mongosh --quiet\"" >> ~/.bashrc

ln -s /workspace/extras/.mongoshrc.js ~/.mongoshrc.js

# remove some warnings
mongosh --eval "disableTelemetry()"
mongosh --eval "db.disableFreeMonitoring()"

# install drivers
/bin/bash /workspace/.devcontainer/scripts/mongodb-go-drivers.sh
/bin/bash /workspace/.devcontainer/scripts/mongodb-node-drivers.sh

# import example data
/bin/bash /workspace/.devcontainer/scripts/import-examples.sh
