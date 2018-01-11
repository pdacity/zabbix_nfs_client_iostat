> Version 1.0 - (20180110)

### Zabbix SNMP Template for NFS client iostat statistics

for Zabbix 3.x (Zabbix 2.x was not tested)

zabbix-agent must be installed on the monitored node

iostat packet MUST be installed

### Install

copy nfsio_perf.sh anf nfsio_discovery.sh into /etc/zabbix/bin
copy userparameter_nfsio.conf into /etc/zabbix/zabbix_agent.d
inport Template 

### Files

* nfsio_discovery.sh - LLD for NFS mountpoints autodiscovery  
* nfsio_perf.sh - collect metrics
* template_nfsio.xml - Zabbix template 
* userparameter_nfsio.conf - Zabbix userparameters file