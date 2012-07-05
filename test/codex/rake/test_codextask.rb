require File.expand_path(File.dirname(__FILE__) + '/../../test_helper.rb')
require 'codex/rake/codextask'

module Codex
  module Rake
    class TestCodexTask < Test::Unit::TestCase
      def setup
        generate
        @task = CodexTask.new do |c|
          # c.content_dir = 'content'
          # c.output_dir  = 'html'
          c.metadata    = "#{APP_ROOT}/config/metadata.yml"
        end
      end

      def test_name_defaults_to_codex
        assert_equal :codex, @task.name
      end

      def test_content_dir_defaults_to_content
        assert_equal 'content', @task.content_dir
      end

      def test_output_dir_defaults_to_html
        assert_equal 'html', @task.output_dir
      end

      def test_clean
        FileUtils.mkdir_p(@task.output_path)
        ::Rake.application.invoke_task('clean')
        assert !File.exists?(@task.output_path)
      end
    end
  end
end