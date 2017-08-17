#!/bin/bash

initd_install() {
    cp time_logger.sh /etc/init.d/
    cd /etc/rc0.d
    ln -s ../init.d/time_logger.sh ./K10time_logger.sh
    cd /etc/rc6.d
    ln -s ../init.d/time_logger.sh ./K10time_logger.sh
    cd /etc/rc2.d
    ln -s ../init.d/time_logger.sh ./S99time_logger.sh
}

initd_uninstall() {
    rm -rf /etc/rc0.d/K10time_logger.sh
    rm -rf /etc/rc6.d/K10time_logger.sh
    rm -rf /etc/rc2.d/S99time_logger.sh
    rm -rf /etc/init.d/time_logger.sh
}

SYSTEMD_EXEC_PATH=/usr/local/bin
SERVICE_PATH=/usr/local/lib/systemd/system
SERVICE_NAME=time-logger.service
SYSTEMD_SERVICE=$SERVICE_PATH/$SERVICE_NAME
systemd_install() {
    cp time_logger.sh $SYSTEMD_EXEC_PATH

    mkdir -p $SERVICE_PATH

    echo "[Unit]" > $SYSTEMD_SERVICE
    echo "Description=Time logger" >> $SYSTEMD_SERVICE
    echo "StopWhenUnneeded=true" >> $SYSTEMD_SERVICE

    echo "[Service]" >> $SYSTEMD_SERVICE
    echo "Type=oneshot" >> $SYSTEMD_SERVICE
    echo "ExecStart=$SYSTEMD_EXEC_PATH/time_logger.sh start" >> $SYSTEMD_SERVICE
    echo "ExecStop=$SYSTEMD_EXEC_PATH/time_logger.sh stop" >> $SYSTEMD_SERVICE
    echo "RemainAfterExit=yes" >> $SYSTEMD_SERVICE

    echo "[Install]" >> $SYSTEMD_SERVICE
    echo "WantedBy=multi-user.target" >> $SYSTEMD_SERVICE

    chmod 0644 $SYSTEMD_SERVICE;
    systemctl enable time-logger.service;
}

systemd_uninstall() {
    rm $SYSTEMD_EXEC_PATH/time_logger.sh
    systemctl disable time-logger.service;
    rm $SYSTEMD_SERVICE
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
    echo "What boot system you have?";
    echo "1. Init.d";
    echo "2. System.d";
    read val;
    if [[ $val == "1" ]]; then
        initd_uninstall;
        initd_install;
    elif [[ $val == "2" ]]; then
        systemd_uninstall;
        systemd_install;
    else
        echo "Wrong point menu";
        exit -1;
    fi
    echo "Logger successful install";
elif [[ $val == "2" ]]; then
    echo "What boot system you have?";
    echo "1. Init.d";
    echo "2. System.d";
    read val;
    if [[ $val == "1" ]]; then
        initd_uninstall;
    elif [[ $val == "2" ]]; then
        systemd_uninstall;
    else
        echo "Wrong point menu";
        exit -1;
    fi
    echo "Logger successful uninstall";
else
    echo "Wrong point menu";
fi
