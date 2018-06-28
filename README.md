# Monitor JAVA Process with JPS

## Created By.Farid Arjmand ##

### update in server

``` ansible-playbook PID.yaml --extra-vars "chmod=0755 owner=zabbix" -K ```

#### Default Variable

```
  - chmod : 0755
  - owner : zabbix
  - srcsh : /root/PID/PID.sh
  - srcconf : /root/PID/PID.conf
  - destsh : /etc/zabbix/scripts/
  - destconf : /etc/zabbix/zabbix_agent.conf.d/ ```
