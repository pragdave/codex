$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Codex; end

require 'codex/content'
require 'codex/pressie'
require 'codex/filter'

# Filters:
require 'codex/filters/code_filter'
require 'codex/filters/ritex_filter'
