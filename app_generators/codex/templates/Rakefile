APP_ROOT = File.dirname(__FILE__) unless defined?(APP_ROOT)
require 'rubygems'
if File.exist?("#{APP_ROOT}/vendor/codex")
  $:.unshift "#{APP_ROOT}/vendor/codex/lib"
else
  gem 'codex'
end
require 'codex/rake/codextask'
Codex.root = APP_ROOT

Codex::Rake::CodexTask.new do |c|
  # c.content_dir = 'content'
  # c.output_dir  = 'html'
  # c.metadata    = "config/metadata.yml"
end