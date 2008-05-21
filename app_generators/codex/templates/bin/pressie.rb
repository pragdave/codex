base = File.join(File.dirname(__FILE__), "..")
$: << File.join(base, "lib")

require 'rubygems'
require "codex"

# Load user defined filters
Dir.glob(Dir.pwd + "/filters/*.rb").each { |f| require f }

Codex::Pressie::process
