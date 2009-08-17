desc "Edit the list of URL templates and their shortcuts"
task "shortcuts:edit" do
  `$EDITOR shortcuts.yml`
  update_hosts
end

desc "Update /etc/hosts with hostnames for our shortcuts"
task "hosts:update" do
  update_hosts
end

def update_hosts
  require 'hosts'
  return unless Hosts.outdated?
  return Hosts.write if Hosts.writable?
  STDERR << "#{File.basename $0}: #{Hosts::PATH} not writable by current user.\n"
  exit 1
end


THIN  = "thin -C config/thin.yml"
namespace :thin do
  desc "Starts the thin server."
  task :start do exec "#{THIN} start" end

  desc "Restarts the thin server."
  task :restart do exec "#{THIN} restart" end

  desc "Stops the thin server."
  task :stop do exec "#{THIN} stop" end
end
