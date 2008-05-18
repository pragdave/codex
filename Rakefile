SLIDES_DIR = 'slides'
HTML_DIR   = 'html'
METADATA = File.join(SLIDES_DIR, "metadata.yml")

Dir.chdir(SLIDES_DIR) { SRC = FileList['*.slides']; SRC.resolve }

OUTPUT = []

SRC.each do |file_name|
  slide_file = File.join(SLIDES_DIR, file_name)
  html_file = File.join(HTML_DIR, file_name.ext('.html'))
  OUTPUT << html_file
  desc "Build #{html_file} from #{slide_file}"
  file html_file => slide_file do
    sh "ruby bin/pressie.rb #{METADATA} #{slide_file} > #{html_file}"
  end
end 

desc "Build the HTML slides from all the files slides/*.slides files"
task :default => OUTPUT

desc "Build all slides based on the contents of slides/table_of_contents.slides"
task :all => [ 'tmp/', 'html/all.html', :remove_tmp ]

task 'html/all.html' => 'tmp/almost_all.html' do 
  sh "ruby bin/postprocess_all.rb tmp/almost_all.html >html/all.html"
end

task 'tmp/almost_all.html' => 'tmp/almost_all.slides' do
  sh "ruby bin/pressie.rb #{METADATA} tmp/almost_all.slides >tmp/almost_all.html"
end

task 'tmp/almost_all.slides' => OUTPUT do
  sh "ruby bin/build_all.rb #{METADATA} slides/table_of_contents.slides tmp/almost_all.slides"
end

file "tmp/" do
  mkdir "tmp"
end

task :remove_tmp do
  FileUtils.rm_rf("tmp") 
end
                       
desc "Remove all work products—slides and temporary files"
task :clean => :remove_tmp do 
  FileUtils.rm OUTPUT, :force => true
  FileUtils.rm "html/all.html", :force => true
end