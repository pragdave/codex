base = File.join(File.dirname(__FILE__), "..")
$: << File.join(base, "lib")

require 'rubygems'
gem 'codex', '>= 1.0.0'
require "codex"

Codex::Pressie::process
