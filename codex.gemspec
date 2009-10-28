# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{codex}
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Thomas"]
  s.date = %q{2009-10-09}
  s.default_executable = %q{codex}
  s.description = %q{Simple tool for creating source-code intensive presentations and courses}
  s.email = ["dave@pragprog.com"]
  s.executables = ["codex"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "app_generators/codex/templates/readme.txt"]
  s.files = ["History.txt", "LICENSE.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "app_generators/codex/USAGE", "app_generators/codex/codex_generator.rb", "app_generators/codex/templates/Rakefile", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/CSS.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/CSharp.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/CollapseCode.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Cpp.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/CrashTest.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Delphi.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/FirstLine.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Index.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Java.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/JavaScript.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/NoControls.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/NoGutter.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/PHP.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Python.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Ruby.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/SQL.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/clipboard.swf", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushCSharp.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushCpp.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushCss.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushDelphi.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushJScript.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushJava.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushPhp.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushPython.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushRuby.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushSql.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushVb.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shBrushXml.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shCore.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Scripts/shCore.uncompressed.js", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/ShowColumns.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/SmartTabs.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Styles/SyntaxHighlighter.css", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Styles/TestPages.css", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/Templates/Test.dwt", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/VB.html", "app_generators/codex/templates/assets/dp.SyntaxHighlighter/XML.html", "app_generators/codex/templates/assets/stylesheets/pressie.css", "app_generators/codex/templates/assets/stylesheets/print.css", "app_generators/codex/templates/assets/stylesheets/ruby.png", "app_generators/codex/templates/assets/ui/default/blank.gif", "app_generators/codex/templates/assets/ui/default/bodybg.gif", "app_generators/codex/templates/assets/ui/default/framing.css", "app_generators/codex/templates/assets/ui/default/iepngfix.htc", "app_generators/codex/templates/assets/ui/default/opera.css", "app_generators/codex/templates/assets/ui/default/outline.css", "app_generators/codex/templates/assets/ui/default/pretty.css", "app_generators/codex/templates/assets/ui/default/print.css", "app_generators/codex/templates/assets/ui/default/s5-core.css", "app_generators/codex/templates/assets/ui/default/slides.css", "app_generators/codex/templates/assets/ui/default/slides.js", "app_generators/codex/templates/bin/build_all.rb", "app_generators/codex/templates/code/control/basic_continuation.rb", "app_generators/codex/templates/code/control/cc_throw_catch.rb", "app_generators/codex/templates/code/control/closure_continuation.rb", "app_generators/codex/templates/code/control/closure_continuation_2.rb", "app_generators/codex/templates/code/graphviz/graph.dot", "app_generators/codex/templates/config/metadata.yml", "app_generators/codex/templates/content/basics.textile", "app_generators/codex/templates/content/building.textile", "app_generators/codex/templates/content/example.textile", "app_generators/codex/templates/content/graphviz.textile", "app_generators/codex/templates/content/including_code.textile", "app_generators/codex/templates/content/including_tex.textile", "app_generators/codex/templates/content/table_of_contents.textile", "app_generators/codex/templates/content/user_defined.textile", "app_generators/codex/templates/filters/example_filter.rb", "app_generators/codex/templates/html/all.html", "app_generators/codex/templates/post_processors/change_code_urls.rb", "app_generators/codex/templates/post_processors/upcase_titles.rb", "app_generators/codex/templates/readme.txt", "app_generators/codex/templates/templates/layout.erb", "bin/codex", "codex.gemspec", "config/hoe.rb", "config/requirements.rb", "lib/codex.rb", "lib/codex/content.rb", "lib/codex/filter.rb", "lib/codex/filters/code_filter.rb", "lib/codex/filters/graphviz_filter.rb", "lib/codex/filters/ritex_filter.rb", "lib/codex/post_processor.rb", "lib/codex/post_processors/01_slides_processor.rb", "lib/codex/post_processors/02_add_title_slides.rb", "lib/codex/pressie.rb", "lib/codex/rake/codextask.rb", "lib/codex/template_handler.rb", "lib/codex/version.rb", "script/console", "script/destroy", "script/generate", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/codex/post_processor/test_add_title_slides_processor.rb", "test/codex/post_processor/test_post_processors.rb", "test/codex/post_processor/test_slides_processor.rb", "test/codex/rake/test_codextask.rb", "test/codex/test_pressie.rb", "test/codex/test_template_handler.rb", "test/test_codex_generator.rb", "test/test_filter.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://codex.rubyforge.org}
  s.post_install_message = %q{
To create new presentations:
	
		codex path/to/presentation/folder
		
}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{codex}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Simple tool for creating source-code intensive presentations and courses}
  s.test_files = ["test/codex/post_processor/test_add_title_slides_processor.rb", "test/codex/post_processor/test_post_processors.rb", "test/codex/post_processor/test_slides_processor.rb", "test/codex/rake/test_codextask.rb", "test/codex/test_pressie.rb", "test/codex/test_template_handler.rb", "test/test_codex_generator.rb", "test/test_filter.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end

  s.add_dependency("rubigen")
  
end
