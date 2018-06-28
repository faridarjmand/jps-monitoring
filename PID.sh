#!/bin/bash
#####################################
PIDTMP="$HOME/PID.tmp"
UNIQ="$HOME/PID.uniq"
#####################################
JPS ()
{
        while read -r line;do
                grp=`echo $line | awk '{print $2}'`
                check=`grep -c $grp $PIDTMP`
                if [ $check == "1" ];then
                        echo $line | awk '{print $2}'
                else
                        farid="3"
                        while [ $farid != "10" ];do
                                grp=`echo $line | awk '{print $'$farid'}'`
                                if [ -z $grp ];then
                                        echo $line | awk '{print $NF}'
                                        break
                                fi
                                check=`grep -c $grp $PIDTMP`
                                if [ $check == "1" ];then
                                        echo $line | awk '{print $'$farid'}' 
                                        break
                                else
                                        ((farid++))
                                fi
                        done
                fi
        done < $PIDTMP
}
PID ()
{
	pid=`grep -c "$1" $PIDTMP`
	if [ $pid == 1 ];then
		grep "$1" $PIDTMP | awk '{print $1}'
	elif [ $pid == 0 ];then
		echo 0
	else
		grep -w "$1$" $PIDTMP | awk '{print $1}'
	fi
}
JSON ()
{
	echo -e "{\n\t\"data\":[\n"
	for j in `cat $UNIQ`;do
		printf "\t { \"{#PROC}\":\"$j\" },\n"
	done
	printf "\t { \"{#END}\":\"END\" }\n"
	echo -e "\n\t]\n}"
}
JPS_APP ()
{
	sudo -u appuser jps -ml | egrep -vc 'jps|unavailable'
}
JPS_ALL ()
{
	ALL_P=`sudo jps -ml | egrep -vc 'jps|unavailable'`
	APP_P=`sudo -u appuser jps -ml | egrep -vc 'jps|unavailable'`
	if [ $ALL_P == $APP_P ];then
		echo 0
	else
		echo 1
	fi
}
RELOAD ()
{
	sudo -u appuser jps -ml | egrep -v 'jps|unavailable' > $PIDTMP
	echo reloaded
}
######################################
case $1 in
	json)JSON;;
	app)JPS_APP;;
	all)JPS_ALL;;
	reload)RELOAD;;
	uniq)JPS > $UNIQ && echo OK;;
	*)PID $1
esac
