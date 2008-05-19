base = File.join(File.dirname(__FILE__), "..")
$: << File.join(base, "lib")

require 'rubygems'
require "codex"

Codex::Pressie::process
