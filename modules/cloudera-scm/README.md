# Puppet module for Cloudera Service and Configuration Manager

## Description
Installs and configures the agent and server components of Cloudera SCM.
Note that, in order for this module to work, you will have to ensure that:
* mysqld is installed and running on your scm server 
* sun jre version 6 or greater is installed
* the mysql jdbc connector is installed
* your package manager is configured with a repository containing the
  cloudera enterprise packages

mysql server, installed, running, no root password
mysql jdbc connector
repositories 

## Usage

### cloudera-scm::agent
<pre>
class { 'cloudera-scm::agent::params':
  server_host => 'scm-host.fakedomain',
  server_port => 7182,
}
include cloudera-scm::agent
</pre>

### cloudera-scm::server
Currently (as of 2011.08.25), only install support is implemented.

<pre>
include cloudera-scm::server::install
</pre>
