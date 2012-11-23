# build ipxe from source
#
#

include_recipe "build-essential"
include_recipe "git"

package  "genisoimage" 

directory node[:ipxe][:install_dir]

execute "ipxe_make" do
  action :nothing
  command  "make"
  cwd "#{node[:ipxe][:install_dir]}/src" 
end

git node[:ipxe][:install_dir] do
  repository node[:ipxe][:git_url] 
  reference node[:ipxe][:git_branch]
  action  node[:ipxe][:git_action]
  notifies :run, "execute[ipxe_make]", :immediate
end

node.override[:ipxe][:bindir] = "#{node[:ipxe][:install_dir]}/src/bin" 



