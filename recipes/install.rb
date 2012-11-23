

case node[:platform_family]
when "debian"
  include_recipe "ipxe::package"
else 
  include_recipe "ipxe::source"
end
