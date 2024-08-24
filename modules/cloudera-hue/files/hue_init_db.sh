#!/bin/bash
# Copyright (c) 2011 Cloudera, Inc. All rights reserved.
# 
#  Cloudera, Inc. licenses this file to you under the Apache License, 
#  Version 2.0 (the "License"). You may not use this file except in 
#  compliance with the License. You may obtain a copy of the License at 
# 
#      http://www.apache.org/licenses/LICENSE-2.0 
# 
#  This software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
#  CONDITIONS OF ANY KIND, either express or implied. See the License for 
#  the specific language governing permissions and limitations under the 
#  License. 
#
# Adapted from /usr/share/cmf/schema/scm_prepare_mysql.sh

GETOPT=`getopt -n $0 -o h:,P:,u:,p:: \
        -l host:,port:,user:,passwd:: \
        -- "$@"`

db_host='localhost'
db_port=
db_user='root'
db_pass=

do_mysql() {
    mysql -u "$db_user" -h "$db_host" ${db_port:+-P$db_port} ${db_pass:+-p$db_pass} 2>/dev/null
}

eval set -- "$GETOPT"
while true; do
    case "$1" in
        -h|--host)
            db_host=$2
            shift 2
            ;;
        -P|--port)
            db_port=$2
            shift 2
            ;;
        -u|--user)
            db_user=$2
            shift 2
            ;;
        -p|--passwd)
            db_pass="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Invalid arguments" >&2
            exit 1
            ;;
    esac
done

db_name=`echo $1 | sed "s/\(['\"\\\`]\)/\\\\\\\\\1/g"`
user=`echo $2 | sed "s/\(['\"\\\`]\)/\\\\\\\\\1/g"`
pass=`echo $3 | sed "s/\(['\"\\\`]\)/\\\\\\\\\1/g"`

if test -z "`echo \"SHOW DATABASES LIKE '$db_name'\" | do_mysql`"; then
    do_mysql <<EOF
CREATE DATABASE \`$db_name\`;
GRANT ALL ON \`$db_name\`.* TO '$user'@'$db_host' IDENTIFIED BY "$pass";
EOF
fi
