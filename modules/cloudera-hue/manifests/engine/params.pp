#
#  Copyright (c) 2011, Cloudera, Inc. All Rights Reserved.
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

class cloudera-hue::engine::params (
  $secret_key, $db_pass,
  $hue_host="localhost", $hue_http_port="8088",
  $db_name="hue", $db_user="hue",
  $db_admin_user="root", $db_admin_pass=undef,
  $namenode_host="localhost", $namenode_port="8020", $namenode_thrift_port="10090",
  $jobtracker_host="localhost", $jobtracker_thrift_port="9290",
  $enterprise=false,
  $cmon_db_name="cmon_db",
  $firehose_port="9999",
  $oozie_host="localhost", $oozie_http_port="11000",
  $timezone=$timezone,
  $flume_master_host=undef, $flume_master_port=undef)
{
  $package_names = $enterprise ? {
    true    => [ "hue", "hue-common", "hue-flume", "hue-beancounter", "hue-cmon",
                 "hue-cloudera-libs" ],
    default => [ "hue", "hue-common" ],
  }
}
