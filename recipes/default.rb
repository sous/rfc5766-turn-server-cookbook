#
# Cookbook Name:: rfc5766-turn-server
# Recipe:: default
#
# Copyright (C) 2013 Sous
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

directory "/opt/debs"

git '/opt/debs/rfc5766-turn-server-precise' do
  repository "https://github.com/sous/rfc5766-turn-server-precise.git"
  reference 'master'
  action :sync
end

execute 'apt-key add /opt/debs/rfc5766-turn-server-precise/apt-key.gpg' do
  command 'cat /opt/debs/rfc5766-turn-server-precise/apt-key.gpg | apt-key add -'
end

include_recipe 'apt'

apt_repository 'rfc5766-turn-server-precise' do
  uri 'file:///opt/debs/rfc5766-turn-server-precise'
  distribution node['lsb']['codename']
  components ["main"]
  action :add
end

