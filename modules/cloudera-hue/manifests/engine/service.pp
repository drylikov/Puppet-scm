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

class cloudera-hue::engine::service inherits cloudera-hue::engine::params {
  service { "hue":
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    subscribe => File["/etc/hue/hue.ini"],
    require => [ Package[$package_names], File["/etc/hue/hue.ini"] ],
  }
}
