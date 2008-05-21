$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Codex; end

require 'codex/content'
require 'codex/pressie'
require 'codex/filter'
require 'codex/ritex_filter'