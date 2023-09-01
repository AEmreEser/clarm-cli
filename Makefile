FILES = ./alarm ./clarm ./alarm.wav
TARGET_DIR = /usr/local/bin
PROFILE_1 = ~/.profile

install: dependencies
	sudo mkdir $(TARGET_DIR)/clarm_cli/;
	sudo cp $(FILES) $(TARGET_DIR)/clarm_cli/;
	sudo chmod +x $(TARGET_DIR)/clarm_cli/clarm
	sudo chmod +x $(TARGET_DIR)/clarm_cli/alarm
	echo "copying files complete";
	export PATH=$(TARGET_DIR)/clarm_cli/:$$PATH;
	echo 'export PATH="$(TARGET_DIR)/clarm_cli/:$$PATH";' >> $(PROFILE_1); 
	echo "installation complete";


dependencies: alsa-tools mplayer at
	echo "Fetching dependencies complete";

alsa-tools:
	sudo apt-get install alsa-tools -y;

mplayer:
	sudo apt-get install mplayer -y;

at:
	sudo apt-get install at -y;
