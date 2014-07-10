#
# Cookbook Name:: accel-ppp
# Attributes:: default
# Author:: Rostyslav Fridman (<rostyslav.fridman@gmail.com>)
#
# Copyright 2014, Rostyslav Fridman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['accel']['user'] = "accel"
default['accel']['group'] = "accel"
default['accel']['install_method'] = "source"

# Used for source installation
default['accel']['url'] = "http://skylink.dl.sourceforge.net/project/accel-ppp"
default['accel']['version'] = "1.7.3"
default['accel']['checksum'] = "bc6eb6e94603b8584976369d9c40a5b430614b54b57368e8656374145ad94059"
default['accel']['radius_support'] = true
default['accel']['snmp_support'] = true
default['accel']['shaper_support'] = true
default['accel']['cmake']['options'] = %W{
-DRADIUS=#{accel['radius_support'] ? "TRUE" : "FALSE"}
-DNETSNMP=#{accel['snmp_support'] ? "TRUE" : "FALSE"}
-DSHAPER=#{accel['shaper_support'] ? "TRUE" : "FALSE"}
}

default['accel']['log']['dir'] = "/var/log/accel-ppp"
default['accel']['ppp']['dir'] = "/etc/ppp"

default['accel']['modules']['log'] = %W{file} # accepted values: file, syslog, tcp, pgsql
default['accel']['modules']['control'] = %W{pptp l2tp} # accepted values: pptp, l2tp, pppoe, ipoe
default['accel']['modules']['auth'] = %W{mschap_v2 mschap_v1 chap_md5 pap} # accepted values: mschap_v2, mschap_v1, chap_md5, pap
default['accel']['modules']['other'] = %W{radius ippool pppd_compat net-snmp} # accepted values: radius, ippool, pppd_compat, shaper, chap-secrets, net-snmp, logwtmp, connlimit
default['accel']['modules']['ipv6'] = %W{} # accepted values: ipv6_nd, ipv6_dhcp, ipv6pool

default['accel']['core']['threads'] = 4

default['accel']['ppp']['verbose'] = 1 # accepted values: 0, 1
default['accel']['ppp']['min_mtu'] = 1280
default['accel']['ppp']['mtu'] = 1400
default['accel']['ppp']['mru'] = 1400
default['accel']['ppp']['ccp'] = 0 # accepted values: 0, 1
default['accel']['ppp']['sid_case'] = false # accepted values: false, lower, upper
default['accel']['ppp']['check_ip'] = 0 # accepted values: 0, 1
default['accel']['ppp']['single_session'] = false # accepted values: false, replace, deny
default['accel']['ppp']['mppe'] = false # accepted values: false, require, prefer, deny
default['accel']['ppp']['ipv4'] = "require" # accepted values: deny, allow, prefer, require
default['accel']['ppp']['lcp_echo_interval'] = 20
default['accel']['ppp']['lcp_echo_failure'] = 3
default['accel']['ppp']['lcp_echo_timeout'] = 120

default['accel']['pptp']['echo_interval'] = 30
default['accel']['pptp']['echo_failure'] = 3
default['accel']['pptp']['mppe'] = "allow"
default['accel']['pptp']['ip_pool']['name'] = "l2tp-pool"
default['accel']['pptp']['ip_pool']['range'] = "10.0.0.2/12"
default['accel']['pptp']['verbose'] = 1

default['accel']['pppoe']['interface'] = {"eth0" => nil}
default['accel']['pppoe']['ac_name'] = false
default['accel']['pppoe']['service_name'] = false
default['accel']['pppoe']['pado_delay'] = false
default['accel']['pppoe']['ifname_in_sid'] = false
default['accel']['pppoe']['tr101'] = false
default['accel']['pppoe']['padi_limit'] = false
default['accel']['pppoe']['ip_pool'] = false
default['accel']['pppoe']['mppe'] = false
default['accel']['pppoe']['verbose'] = 1

default['accel']['l2tp']['dictionary'] = "/usr/local/share/accel-ppp/l2tp/dictionary"
default['accel']['l2tp']['hello_interval'] = 60
default['accel']['l2tp']['timeout'] = 60
default['accel']['l2tp']['rtimeout'] = 5
default['accel']['l2tp']['retransmit'] = 5
default['accel']['l2tp']['dir300_quirk'] = 0
default['accel']['l2tp']['mppe'] = "allow"
default['accel']['l2tp']['ip_pool']['name'] = "l2tp-pool"
default['accel']['l2tp']['ip_pool']['range'] = "10.0.0.2/12"
default['accel']['l2tp']['verbose'] = 1

default['accel']['dns']['first'] = "8.8.8.8"
default['accel']['dns']['second'] = "8.8.4.4"

default['accel']['wins_enable'] = false
default['accel']['wins']['first'] = "172.16.0.1"
default['accel']['wins']['second'] = "172.16.1.1"

default['accel']['radius']['dictionary'] = "/usr/local/share/accel-ppp/radius/dictionary"
default['accel']['radius']['nas_identifier'] = false
default['accel']['radius']['nas_ip'] = false
default['accel']['radius']['secret'] = "s3cr3t"
default['accel']['radius']['auth_port'] = 1812
default['accel']['radius']['acct_port'] = 1813
default['accel']['radius']['req_limit'] = 0
default['accel']['radius']['fail_time'] = 30
default['accel']['radius']['dae_port'] = 3799
default['accel']['radius']['dae_secret'] = "s3cr3t"
default['accel']['radius']['verbose'] = 1
default['accel']['radius']['interim_verbose'] = 0
default['accel']['radius']['timeout'] = 3
default['accel']['radius']['max_try'] = 3
default['accel']['radius']['acct_interim_interval'] = 60
default['accel']['radius']['acct_timeout'] = 120
default['accel']['radius']['acct_delay_time'] = 0

default['accel']['client_ip_range'] = false

default['accel']['ip_pool']['gw_ip_address'] = "10.0.0.1"

default['accel']['log']['syslog_facility'] = "daemon" # accepted values: daemon, local0-local7
default['accel']['log']['debug'] = false
default['accel']['log']['tcp'] = "127.0.0.1:3000" # ip:port
default['accel']['log']['copy'] = 1
default['accel']['log']['color'] = 0
default['accel']['log']['per_session'] = 0
default['accel']['log']['per_user_dir'] = false
default['accel']['log']['per_session_dir'] = false
default['accel']['log']['level'] = 5

default['accel']['pppd_compat']['ip_pre_up'] = false
default['accel']['pppd_compat']['verbose'] = 0

default['accel']['chap_secrets']['gw_ip_address'] = "192.168.100.1"
default['accel']['chap_secrets']['encrypted'] = 0
default['accel']['chap_secrets']['username_hash'] = "md5"

default['accel']['shaper']['attr'] = "Filter-Id"
default['accel']['shaper']['down_burst_factor'] = "0.1"
default['accel']['shaper']['up_burst_factor'] = "1.0"
default['accel']['shaper']['latency'] = 50
default['accel']['shaper']['mpu'] = 0
default['accel']['shaper']['r2q'] = 10
default['accel']['shaper']['quantum'] = 1500
default['accel']['shaper']['cburst'] = 1534
default['accel']['shaper']['ifb'] = "ifb0"
default['accel']['shaper']['up_limiter'] = "police"
default['accel']['shaper']['down_limiter'] = "tbf"
default['accel']['shaper']['leaf_qdisc'] = "sfq perturb 10"
default['accel']['shaper']['verbose'] = 1

default['accel']['cli']['telnet'] = "127.0.0.1:2000"
default['accel']['cli']['tcp'] = "127.0.0.1:2001"
default['accel']['cli']['password'] = false

default['accel']['snmp']['master'] = 0

if accel['snmp'] and accel['snmp']['master'] == 0
  default['snmp']['snmpd']['trapd_run'] = "yes"
end

default['accel']['connlimit']['limit'] = "10/min"
default['accel']['connlimit']['burst'] = 3
default['accel']['connlimit']['timeout'] = 60
