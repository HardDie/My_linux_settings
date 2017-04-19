#!/bin/bash

install() {
    cp time_logger.sh /etc/init.d/
    cd /etc/rc0.d
    ln -s ../init.d/time_logger.sh ./K10time_logger.sh
    cd /etc/rc6.d
    ln -s ../init.d/time_logger.sh ./K10time_logger.sh
    cd /etc/rc2.d
    ln -s ../init.d/time_logger.sh ./S99time_logger.sh
}

uninstall() {
    rm -rf /etc/rc0.d/K10time_logger.sh
    rm -rf /etc/rc6.d/K10time_logger.sh
    rm -rf /etc/rc2.d/S99time_logger.sh
    rm -rf /etc/init.d/time_logger.sh
}

if [[ !( $USER = root ) ]]; then
	echo "Permision denied, run as root";
	exit 0;
fi

echo "What you want do?";
echo "1. Install logger";
echo "2. Uninstall logger";
echo;
echo -n "Input: ";

read val;

if [[ $val == "1" ]]; then
    uninstall;
    install;
    echo "Logger successful install";
elif [[ $val == "2" ]]; then
    uninstall;
    echo "Logger successful uninstall";
else
    echo "Wrong point menu";
fi
