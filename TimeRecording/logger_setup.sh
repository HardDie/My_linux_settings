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
systemd_install() {
    SCRIPT_NAME=/etc/systemd/system/time-logger.service;
    cp time_logger.sh $SYSTEMD_EXEC_PATH
    echo "[Unit]" > $SCRIPT_NAME
    echo "Description=Time logger" >> $SCRIPT_NAME
    echo "StopWhenUnneeded=true" >> $SCRIPT_NAME

    echo "[Service]" >> $SCRIPT_NAME
    echo "Type=oneshot" >> $SCRIPT_NAME
    echo "ExecStart=$SYSTEMD_EXEC_PATH/time_logger.sh start" >> $SCRIPT_NAME
    echo "ExecStop=$SYSTEMD_EXEC_PATH/time_logger.sh stop" >> $SCRIPT_NAME
    echo "RemainAfterExit=yes" >> $SCRIPT_NAME

    echo "[Install]" >> $SCRIPT_NAME
    echo "WantedBy=multi-user.target" >> $SCRIPT_NAME

    chmod a+rwx $SCRIPT_NAME;
    systemctl enable time-logger.service;
}

systemd_uninstall() {
    SCRIPT_NAME=/etc/systemd/system/time-logger.service;
    rm $SYSTEMD_EXEC_PATH/time_logger.sh
    systemctl disable time-logger.service;
    rm $SCRIPT_NAME
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
