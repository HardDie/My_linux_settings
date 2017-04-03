#!/bin/bash
cp time_logger.sh /etc/init.d/
cd /etc/rc0.d
ln -s ../init.d/time_logger.sh ./K10time_logger.sh
cd /etc/rc6.d
ln -s ../init.d/time_logger.sh ./K10time_logger.sh
cd /etc/rc2.d
ln -s ../init.d/time_logger.sh ./S99time_logger.sh
