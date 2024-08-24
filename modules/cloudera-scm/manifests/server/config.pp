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

class cloudera-scm::server::config inherits cloudera-scm::server::params {
  $adm_pass_cmdline = $db_admin_pass ? {
    undef   => "",
    default => "-p'$db_admin_pass'",
  }
  exec { "scm-install-schema":
    command     => "/usr/share/cmf/schema/scm_prepare_mysql.sh -u '$db_admin_user' $adm_pass_cmdline '$db_name' '$db_user' '$db_pass'",
    require     => Package[$package_names],
    unless      => "/usr/bin/mysqlcheck -u '$db_admin_user' $adm_pass_cmdline -s '$db_name'",
  }
}
