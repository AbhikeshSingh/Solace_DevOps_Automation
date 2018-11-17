#!/bin/bash
 
SOLACE_IP=192.168.1.102:8080
CRED=Abhikesh:Abhikesh
 
CREATE_VPN="\
<rpc semp-version=\"soltr/8_13_1\">
    <create>
        <message-vpn>
            <vpn-name>Abhikesh_VPN</vpn-name>
        </message-vpn>
    </create>
</rpc>\
"
START_VPN="\
<rpc semp-version=\"soltr/8_13_1\">
    <message-vpn>
        <vpn-name>Solace-CICD</vpn-name>
        <no>
            <shutdown></shutdown>
        </no>
    </message-vpn>
</rpc>\
"
 
echo "${CREATE_VPN}" | curl -d @- -u "${CRED}" http://${SOLACE_IP}/SEMP
echo "${START_VPN}" | curl -d @- -u "${CRED}" http://${SOLACE_IP}/SEMP
