#! /bin/bash
### BEGIN INIT INFO
# Provides:          skeleton
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Example initscript
# Description:       This file should be used to construct scripts to be
#                    placed in /etc/init.d.
### END INIT INFO

# Author: Foo Bar <foobar@baz.org>
#
# Please remove the "Author" lines above and replace them
# with your own name if you copy and modify this script.

# Do NOT "set -e"

# PATH should only include /usr/* if it runs after the mountnfs.sh script
DESC="Logging on and off PC"
NAME=time_logger
SCRIPTNAME=/etc/init.d/$NAME
FILE=/home/oleg/Desktop/time.log

#
# Function that starts the daemon/service
#

print_month() {
    echo >> $FILE;
    echo >> $FILE;
    month="--------------------"`date +"%B"`"--------------------";
    echo $month >> $FILE;
}

calc_month_time() {
    result_sum=0;
    # Uptime with hours and minutes
    dates_for_sum=`cat $FILE | grep -A 2 "$last_year" | grep -iA 2 "$last_month" | grep "up" | awk '$3 ~/hours/' | awk '{ print $2":"$4 }'`;
    # Add Uptime with only minutes
    dates_for_sum=$dates_for_sum" "`cat $FILE | grep -A 2 "$last_year" | grep -iA 2 "$last_month" | grep "up" | awk '$3 ~/minutes/' | awk '{ print "00:"$2 }'`;
    # Calculate all time
    if [[ ! -z $dates_for_sum ]]; then
        for i in $dates_for_sum; do
            StartDate=$(date -u -d "$result_sum" +"%s");
            FinalDate=$(date -u -d "$i" +"%s");
            result_sum=$(date -u -d "0 $StartDate sec + $FinalDate sec" +"%H:%M:%S");
        done;
    fi;
}

do_start()
{
    last_date=`cat $FILE | grep '> ' | tail -1`;
    if [[ -z $last_date ]]; then
        print_month;
    else
        last_month=`echo $last_date | cut -d ' ' -f 3`;
        cur_month=`date +"%h"`;
        if [[ $last_month != $cur_month ]]; then
            last_year=`echo $last_date | cut -d ' ' -f 7`;
            calc_month_time;
            echo "Time on this month: "$result_sum >> $FILE;
            print_month;
        fi
    fi
    echo -n "> " >> $FILE;
    date >> $FILE;
}

#
# Function that stops the daemon/service
#
do_stop()
{
    echo -n "< " >> $FILE;
    date >> $FILE;
    uptime -p >> $FILE;
    echo "----------------------------------------------------" >> $FILE;
}

case "$1" in
    start)
        do_start;
        ;;
    stop)
        do_stop;
        ;;
    *)
        echo "Usage: $SCRIPTNAME {start|stop}" >&2;
        exit 3;
        ;;
esac

:
