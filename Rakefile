$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'config/requirements'
require 'config/hoe' # setup Hoe + all gem configuration

Dir['tasks/**/*.rake'].each { |rake| load rake }