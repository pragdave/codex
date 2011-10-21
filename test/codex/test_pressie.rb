require File.expand_path(File.dirname(__FILE__) + '/../test_helper.rb')

module Codex
  class TestPressie < Test::Unit::TestCase

    def setup
      generate
      @pressie = Pressie.new("#{APP_ROOT}/config/metadata.yml")
      @input = "#{APP_ROOT}/content/building.textile"
      @output = "#{APP_ROOT}/html/building.html"
    end

    def teardown
      bare_teardown
    end

    def test_process
      assert !File.exist?(@output), "#{@output} already exists"
      @pressie.process(@input, @output)
      puts @output.inspect
      assert File.exist?(@output)
    end

  end
end
