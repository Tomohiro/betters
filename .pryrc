# vim: ft=ruby

# michaeldv/awesome_print
# https://github.com/michaeldv/awesome_print
require 'awesome_print'
AwesomePrint.pry!

# cldwalker/hirb
# https://github.com/cldwalker/hirb
require 'hirb'
Hirb.enable

# Using Hirb only for collections [feature request]  Issue #74  cldwalker/hirb
# https://github.com/cldwalker/hirb/issues/74
def hirb(obj)
  puts Hirb::Helpers::AutoTable.render(obj)
end
