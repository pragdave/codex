# Don't change this file!
unless defined?(APP_ROOT)
  APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
end

module Codex
  class << self
    def boot!
      require 'rubygems'
      if File.exist?("#{APP_ROOT}/vendor/codex")
        $: << "#{APP_ROOT}/vendor/codex/lib"
      else
        gem 'codex'
      end
      require 'codex'
    end

  end
end

Codex.boot!