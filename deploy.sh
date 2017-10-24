#! /bin/bash

function deploy_webos() {
	cd $WEBOS_CLI_TV
	./ares-package octosmart
	if [ "$#" -ge 1 ]; then
		./ares-install com.octosmart.app_1.0.0_all.ipk -d $1
		./ares-launch com.octosmart.app -d $1
	else
		./ares-install com.octosmart.app_1.0.0_all.ipk
		./ares-launch com.octosmart.app
	fi
}


./qmlcore/build

if [ "$1" == "webos" ]; then
	if [ -z ${WEBOS_CLI_TV+x} ]; then
		echo "WEBOS_CLI_TV is unset. Probably webOS SDK wasn't installed"
		exit 1
	fi

	echo "============== WEBOS DEPLOYMENT =============="
	echo "Update deploy directory..."
	rm -rf "$WEBOS_CLI_TV/octosmart"
	cp -r ./build.webos "$WEBOS_CLI_TV/octosmart"
	echo "Build and run package..."

	if [ "$#" -ge 1 ]; then
		deploy_webos $2
	else
		deploy_webos
	fi
fi
