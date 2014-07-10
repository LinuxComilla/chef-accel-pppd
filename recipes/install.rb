#
# Cookbook Name:: accel-ppp
# Recipe:: install
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

user node['accel']['user'] do
  comment "Accel-PPP user"
  system true
  shell "/bin/false"
end

group node['accel']['group'] do
  system true
end

case node['platform']
  when "debian", "ubuntu"
    %w{libpcre3-dev libsnmp-dev snmp-mibs-downloader}.each do |pkg|
      package pkg do
        action :install
      end
    end
    if Gem::Version.new(node['lsb']['release']) >= Gem::Version.new("13.10")
      package "libnl-dev" do
        action :install
      end
    else
      package "libnl2-dev" do
        action :install
      end
    end
    directory "/usr/share/mibs/site" do
      owner  "root"
      group  "root"
      mode   00755
      action :create
    end
    cookbook_file "ACCEL-PPP-MIB.txt" do
      path "/usr/share/mibs/site/ACCEL-PPP-MIB.txt"
      action :create_if_missing
    end
  when "redhat", "centos", "amazon", "scientific"
    %w{pcre-devel libnl-devel net-snmp-devel}.each do |pkg|
      package pkg do
        action :install
      end
    end
    cookbook_file "ACCEL-PPP-MIB.txt" do
      path "/usr/share/snmp/mibs/ACCEL-PPP-MIB.txt"
      action :create_if_missing
    end
end

include_recipe "accel-ppp::#{node['accel']['install_method']}"
