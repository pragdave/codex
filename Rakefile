$:.unshift File.join(File.dirname(__FILE__), 'lib')

# Hoe insists on reading every damn file looking for a version string.
# This can't work, because we don't know what the encoding is   
Encoding.default_external = 'binary' if defined?(Encoding)

require 'config/requirements'
require 'config/hoe' # setup Hoe + all gem configuration

Dir['tasks/**/*.rake'].each { |rake| load rake }