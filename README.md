# Zabbix LLD Template for NFS client iostat statistics

![Docker stuff](https://img.shields.io/badge/%F0%9F%90%B3-useful%20stuff-lightgray)
![PizzaWare](https://img.shields.io/badge/%F0%9F%8D%95-PizzaWare-orange)
![Tea powered](https://img.shields.io/badge/%F0%9F%8D%B5-tea%20powered-yellowgreen)

> Version 1.1 - (20180113)

for Zabbix 3.x (Zabbix 2.x was not tested)

zabbix-agent must be installed on the monitored node

iostat packet MUST be installed

## Install

* copy nfsio_perf.sh anf nfsio_discovery.sh into /etc/zabbix/bin
* copy userparameter_nfsio.conf into /etc/zabbix/zabbix_agent.d
* inport Template 
* restart zabbix_agent

## Files

* nfsio_discovery.sh - LLD for NFS mountpoints autodiscovery  
* nfsio_perf.sh - collect metrics
* template_nfsio.xml - Zabbix template 
* userparameter_nfsio.conf - Zabbix userparameters file

## References

* yumaojun03/zabbix_monitor - https://github.com/yumaojun03/zabbix_monitor

## Version

* 1.0 - initial
* 1.1 - add "Read / Write kB/s", "Read / Write op/s" and "RPC request time" graphs into Template
