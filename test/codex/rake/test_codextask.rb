require File.expand_path(File.dirname(__FILE__) + '/../../test_helper.rb')
require 'codex/rake/codextask'

module Codex
  module Rake
    class TestCodexTask < Test::Unit::TestCase
      def setup
        generate
        @task = CodexTask.new
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

      def test_metadata_defaults_to_yml
        assert_equal 'content/metadata.yml', @task.metadata
      end

      def test_clean
        FileUtils.mkdir_p(@task.output_path)
        ::Rake.application.invoke_task('clean')
        assert !File.exists?(@task.output_path)
      end
    end
  end
end