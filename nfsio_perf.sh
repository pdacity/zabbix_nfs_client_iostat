#!/bin/bash
# ============================================================
# Author: Dmitry Malinin
# E.mail: dmitry@malinin.com
# Blog: http://zabbix.guru
# Filename: nfsio_discovery.sh
# Modified: 2018-01-10
# Description: Discovery NFS mountpoints.
#
# Parameters:
#
# nfsio-perf <mountpoint> <metric>
#
# Metrics:
#
# summary：
# op_s			summary operations per second
# bklog			symmary length of the backlog queue
#
# read:
# read_ops_s		number of read operations per second
# read_kB_s		number of kB read per second
# read_kB_op		number of kB read per each operation1
# read_retry		number of read retransmissions
# read_retry_perc	number of read retransmissions in percent
# read_rtt		duration read time to receives the replyclient (Round Travel Time)
# read_exe		duration until the RPC read request is completed (includes the RTT time)
#
# write:
# write_ops_s		number of write operations per second
# write_kB_s		number of kB write per second
# write_kB_op		number of kB write per each operation1
# write_retry		number of write retransmissions
# write_retry_perc	number of write retransmissions in percent
# write_rtt		duration write time to receives the replyclient (Round Travel Time)
# write_exe		duration until the RPC write request is completed (includes the RTT time)
#
# ===========================================================

NFS_MOUNT=$1
NFS_IO=$2

CMD=/usr/sbin/nfsiostat

case ${NFS_IO} in
    op_s)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 'rpc bklog' |tail -1| awk -F' ' '{print $1}'`
        echo ${result}
        ;;
    bklog)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 'rpc bklog' |tail -1| awk -F' ' '{print $2}'`
        echo ${result}
        ;;
    read_ops_s)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^read:' |tail -1| awk -F' ' '{print $1}'`
        echo ${result}
        ;;
    read_kB_s)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^read:' |tail -1| awk -F' ' '{print $2}'`
        echo ${result}
        ;;
    read_kB_op)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^read:' |tail -1| awk -F' ' '{print $3}'`
        echo ${result}
        ;;
    read_retry)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^read:' |tail -1| awk -F' ' '{print $4}'`
        echo ${result}
        ;;
    read_retry_perc)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^read:' |tail -1| awk -F' ' '{print $5}' | grep -o '[^(].*[^%)]'`
        echo ${result}
        ;;
    read_rtt)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^read:' |tail -1| awk -F' ' '{print $6}'`
        echo ${result}
        ;;
    read_exe)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^read:' |tail -1| awk -F' ' '{print $7}'`
        echo ${result}
        ;;
    write_ops_s)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^write:' |tail -1| awk -F' ' '{print $1}'`
        echo ${result}
        ;;
    write_kB_s)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^write:' |tail -1| awk -F' ' '{print $2}'`
        echo ${result}
        ;;
    write_kB_op)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^write:' |tail -1| awk -F' ' '{print $3}'`
        echo ${result}
        ;;
    write_retry)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^write:' |tail -1| awk -F' ' '{print $4}'`
        echo ${result}
        ;;
    write_retry_perc)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^write:' |tail -1| awk -F' ' '{print $5}' | grep -o '[^(].*[^%)]'`
        echo ${result}
        ;;
    write_rtt)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^write:' |tail -1| awk -F' ' '{print $6}'`
        echo ${result}
        ;;
    write_exe)
        result=`$CMD 1 3 $NFS_MOUNT| grep -A 1 '^write:' |tail -1| awk -F' ' '{print $7}'`
        echo ${result}
        ;;
esac
