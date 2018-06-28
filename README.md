# Monitor JAVA Process with JPS

## Created By.Farid Arjmand ##

### Update in Server

``` ansible-playbook PID.yaml --extra-vars "chmod=0755 owner=zabbix" -K ```

#### Default Variable

``` ansible
  - chmod : 0755
  - owner : zabbix
  - srcsh : /root/PID/PID.sh
  - srcconf : /root/PID/PID.conf
  - destsh : /etc/zabbix/scripts/
  - destconf : /etc/zabbix/zabbix_agent.conf.d/
```

### Zabbix template installation
This guide will step you through the import of the PID.xml monitoring template.

#### Import the template

* Save the XML template file to a convenient location

* Open the Zabbix console

* Navigate to `Configuration` > `Templates`

* Click the `Import` button

* Select the downloaded `PID.xml` file

* Tick the `Create new / Screens` checkbox

* Click `Import`
