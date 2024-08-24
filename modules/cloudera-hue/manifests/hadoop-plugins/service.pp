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

class cloudera-hue::hadoop-plugins::service
  inherits cloudera-hue::hadoop-plugins::params {

  if ($enterprise) {
    service { "hue-cmon-agent":
      ensure     => running,
      hasrestart => true,
      hasstatus  => true,
      require    => [ Package[$package_names],
                      File["/etc/cloudera/cmon-agent.ini"] ],
      subscribe  => File["/etc/cloudera/cmon-agent.ini"],
    }
  }
}
