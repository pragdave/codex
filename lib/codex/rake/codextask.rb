require 'codex'
require 'rake'
require 'rake/tasklib'

module Codex
  module Rake
    class CodexTask < ::Rake::TaskLib
      attr_accessor :name
      
      # Directory of the source content. Defaults to 'content'
      attr_accessor :content_dir

      # Directory to output the built files into. Defaults to 'html'
      attr_accessor :output_dir

      # Metadata filename. Defaults to #{content_dir}/metadata.yml
      attr_accessor :metadata

      def initialize(name = :codex)
        @name = name
        @content_dir = 'content'
        @output_dir = 'html'
        @metadata = "#{content_dir}/metadata.yml"
        yield self if block_given?
        define
      end
      
      def content_path
        File.join(*[Codex.root, content_dir].compact)
      end
      
      def output_path
        File.join(*[Codex.root, output_dir].compact)
      end
      
      def contents
        Dir.chdir(content_path) do
          filelist = FileList["*"]
          filelist.resolve
          filelist
        end
      end

      def define
        @output = []
        contents.each do |file|
          input_file = File.join(content_dir, file)
          output_file = File.join(output_dir, file.ext('.html'))
          @output << output_file
          desc "Build #{output_file} from #{input_file}"
          file output_file => [output_dir, input_file] do
            Codex::Pressie.new(metadata).process(input_file, output_file)
          end
        end

        task :default => name
        
        desc "Build all the content"
        task name => @output
        
        # FIXME: clean up all this
        all_html   = File.join(output_dir, "all.html")
        namespace name do
          desc "Build all based on the contents of content/table_of_contents.textile"
          task :all => [ 'tmp', output_dir, all_html, :remove_tmp ]

          task :remove_tmp do
            FileUtils.rm_rf("tmp")
          end
        end

        desc "Remove all generated output and temporary files"
        task :clean => "#{name}:remove_tmp" do
          FileUtils.rm_rf output_path
        end
        
        task all_html => 'tmp/almost_all.html' do
          sh "ruby bin/postprocess_all.rb tmp/almost_all.html > #{all_html}"
        end

        task 'tmp/almost_all.html' => 'tmp/almost_all.textile' do
          Codex::Pressie.new(metadata).process('tmp/almost_all.textile', 'tmp/almost_all.html')
        end

        task 'tmp/almost_all.textile' => @output do
          sh "ruby bin/build_all.rb #{metadata} #{content_dir}/table_of_contents.textile tmp/almost_all.textile"
        end

        directory "tmp"

        directory output_dir
      end
    
    end
  end
end