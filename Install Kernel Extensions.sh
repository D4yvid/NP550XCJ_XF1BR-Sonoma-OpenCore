#!/usr/bin/env bash

CONFIG=DEBUG

URLS=(
	"https://github.com/acidanthera/Lilu/releases/download/1.6.7/Lilu-1.6.7-$CONFIG.zip"
	"https://github.com/acidanthera/VirtualSMC/releases/download/1.3.2/VirtualSMC-1.3.2-$CONFIG.zip"
	"https://github.com/acidanthera/WhateverGreen/releases/download/1.6.6/WhateverGreen-1.6.6-$CONFIG.zip"
	"https://github.com/acidanthera/AppleALC/releases/download/1.9.0/AppleALC-1.9.0-$CONFIG.zip"
	"https://github.com/Mieze/RTL8111_driver_for_OS_X/releases/download/2.4.2/RealtekRTL8111-V2.4.2.zip"
	"https://github.com/OpenIntelWireless/itlwm/releases/download/v2.3.0/AirportItlwm_v2.3.0_stable_Sonoma14.4.kext.zip"
	"https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases/download/v2.4.0/IntelBluetooth-v2.4.0.zip"
	"https://github.com/acidanthera/VoodooPS2/releases/download/2.3.5/VoodooPS2Controller-2.3.5-$CONFIG.zip"
	"https://github.com/VoodooI2C/VoodooI2C/releases/download/2.8/VoodooI2C-2.8.zip"
	"https://github.com/1Revenger1/ECEnabler/releases/download/1.0.4/ECEnabler-1.0.4-$CONFIG.zip"
	"https://github.com/acidanthera/BrcmPatchRAM/releases/download/2.6.8/BrcmPatchRAM-2.6.8-$CONFIG.zip"
)

pushd "Kernel Extensions/" > /dev/null

for URL in "${URLS[@]}"; do
	NAME=$(basename "$URL")

	echo "Downloading $NAME..."

	(wget -O "$NAME" "$URL" > /dev/null 2> /dev/null \
		&& echo "Downloaded $NAME successfully!" \
		|| echo "Downloaded $NAME failed") &
done

wait

popd > /dev/null

