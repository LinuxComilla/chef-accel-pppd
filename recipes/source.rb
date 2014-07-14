#
# Cookbook Name:: accel-ppp
# Recipe:: source
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

include_recipe "checkinstall::default"

remote_file "#{Chef::Config['file_cache_path']}/accel-ppp-#{node['accel']['version']}.tar.bz2" do
  source   "#{node['accel']['url']}/accel-ppp-#{node['accel']['version']}.tar.bz2"
  checksum node['accel']['checksum']
  mode     00644
end

%W{/var/log/accel-ppp /var/run/accel-ppp /etc/accel-ppp}.each do |folder|
  directory folder do
    owner  node['accel']['user']
    group  node['accel']['group']
    mode   00755
    action :create
  end
end

checkinstall_package "accel-ppp" do
  source_archive "#{Chef::Config['file_cache_path']}/accel-ppp-#{node['accel']['version']}.tar.bz2"
  configure_options node['accel']['cmake']['options']
  version node['accel']['version']
  binary_name "accel-pppd"
  cmake true
  configure false
end
