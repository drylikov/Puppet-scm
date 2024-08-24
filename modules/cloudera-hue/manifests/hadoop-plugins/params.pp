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

class cloudera-hue::hadoop-plugins::params (
  $enterprise=false, $hue_host="localhost", $firehose_port="9999") {

  if ($enterprise and (!$hue_host or !$firehose_port)) {
    fail("Configuring the hue cmon plugin requires that hue_host and firehose_port be set.")
  }

  $package_names = $enterprise  ? {
    true  => [ "hue-plugins", "hue-hadoop-auth-plugin", "hue-cmon-plugin" ],
    false => [ "hue-plugins" ],
  }
}
