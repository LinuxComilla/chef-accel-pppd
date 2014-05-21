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

version = node[:accel][:version]
install_path = "/usr/local/sbin/accel-pppd"

remote_file "#{Chef::Config[:file_cache_path]}/accel-ppp-#{version}.tar.bz2" do
  source   "#{node[:accel][:url]}/accel-ppp-#{version}.tar.bz2"
  checksum node[:accel][:checksum]
  mode     00644
end

accel_install = false

if File.exists?(install_path)
  cmd = Mixlib::ShellOut.new(node[:version_check][:command])
  cmd.run_command
  matches = cmd.stdout.downcase.squeeze(' ').match(/version\s?: ([0-9\.]+)/)
  current_version = matches[1]
  if Gem::Version.new(version) > Gem::Version.new(current_version)
    accel_install = true
  end
else
  accel_install = true
end

directory "/var/log/accel-ppp/" do
  owner  node[:accel][:user]
  group  node[:accel][:group]
  mode   00755
  action :create
end

directory "/var/run/accel-ppp" do
  owner  node[:accel][:user]
  group  node[:accel][:group]
  mode   00755
  action :create
end

directory "/etc/accel-ppp" do
  owner  node[:accel][:user]
  group  node[:accel][:group]
  mode   00755
  action :create
end

bash "build-and-install-accel-ppp" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  tar jxvf accel-ppp-#{version}.tar.bz2
  (cd accel-ppp-#{version} && cmake #{node[:accel][:cmake][:options].join(' ')} .)
  (cd accel-ppp-#{version} && make && checkinstall #{node[:checkinstall][:options]})
  EOF
  not_if { accel_install == false }
end
