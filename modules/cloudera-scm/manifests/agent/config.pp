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

class cloudera-scm::agent::config inherits cloudera-scm::agent::params {
  file { "scm-config.ini":
    path    => "/etc/cloudera-scm-agent/config.ini",
    content => template("cloudera-scm/scm-config.ini.erb"),
    require => Package["cloudera-scm-agent"],
  }
}
