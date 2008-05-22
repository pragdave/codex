base_dir = File.dirname(__FILE__)
$:.unshift(base_dir) unless
  $:.include?(base_dir) || $:.include?(File.expand_path(base_dir))

module Codex; end

require 'codex/content'
require 'codex/pressie'
require 'codex/filter'

# Filters:    

# If a filter fails to load, simply ignore it (it may be a missing local gem, such
# as ritex). This means that folks who write filters must ensure that their source
# throws an exception should it fail to find all its dependencies

Dir.glob(File.join(base_dir, 'codex/filters/*.rb')) do |filter|
  begin
    require(filter)
  rescue Exception => e
    ;
  end
end
