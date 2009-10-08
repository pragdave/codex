module Codex
  class << self
    # Where the codex slides are located
    attr_accessor :root
    # Where the codex libraries are located (it may be a gem or in vendor dir)
    attr_accessor :lib_root
  end
end

base_dir = File.dirname(__FILE__)
$:.unshift(base_dir) unless
  $:.include?(base_dir) || $:.include?(File.expand_path(base_dir))
Codex.lib_root = base_dir

require 'codex/content'
require 'codex/pressie'
require 'codex/filter'
require 'codex/post_processor'
require 'codex/post_processor/slides'
require 'codex/template_handler'
