# Must set before requiring generator libs.
TMP_ROOT = File.dirname(__FILE__) + "/tmp" unless defined?(TMP_ROOT)
PROJECT_NAME = "myproject" unless defined?(PROJECT_NAME)
app_root = File.join(TMP_ROOT, PROJECT_NAME)
if defined?(APP_ROOT)
  APP_ROOT.replace(app_root)
else
  APP_ROOT = app_root
end

require 'rubygems'
require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + '/../lib/codex')

require 'rubigen'
require 'rubigen/helpers/generator_test_helper'

Codex.root = APP_ROOT

class Test::Unit::TestCase
  include RubiGen::GeneratorTestHelper
  
private
  
  def generate    
    run_generator('codex', [Codex.root], sources)
  end
  
  def sources
    [ RubiGen::PathSource.new(:test, File.join(File.dirname(__FILE__),"..", 'app_generators')) ]
  end

end
