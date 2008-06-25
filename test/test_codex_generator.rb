require File.join(File.dirname(__FILE__), "test_generator_helper.rb")

class TestCodexGenerator < Test::Unit::TestCase
  include RubiGen::GeneratorTestHelper

  def setup
    bare_setup
  end

  def teardown
    bare_teardown
  end

  # Some generator-related assertions:
  #   assert_generated_file(name, &block) # block passed the file contents
  #   assert_directory_exists(name)
  #   assert_generated_class(name, &block)
  #   assert_generated_module(name, &block)
  #   assert_generated_test_for(name, &block)
  # The assert_generated_(class|module|test_for) &block is passed the body of the class/module within the file
  #   assert_has_method(body, *methods) # check that the body has a list of methods (methods with parentheses not supported yet)
  #
  # Other helper methods are:
  #   app_root_files - put this in teardown to show files generated by the test method (e.g. p app_root_files)
  #   bare_setup - place this in setup method to create the APP_ROOT folder for each test
  #   bare_teardown - place this in teardown method to destroy the TMP_ROOT or APP_ROOT folder after each test

  def test_generator_without_options
    run_generator('codex', [APP_ROOT], sources)
    assert_directory_exists "bin"
    assert_directory_exists "code/control"
    assert_directory_exists "html"
    assert_directory_exists "content"
    assert_directory_exists "dp.SyntaxHighlighter"
    assert_directory_exists "script"
    assert_generated_file   "Rakefile"
    assert_generated_file   "html/all.html"
    %w[basics building example including_code table_of_contents].each do |slide|
      assert_generated_file "content/#{slide}.textile"
    end
    assert_generated_file "content/metadata.yml"
    %w[build_all postprocess_all pressie].each do |bin|
      assert_generated_file "bin/#{bin}.rb"
    end
    %w[basic_continuation cc_throw_catch closure_continuation closure_continuation_2].each do |code|
      assert_generated_file "code/control/#{code}.rb"
    end
    ["CollapseCode.html", "Cpp.html", "CrashTest.html", "CSharp.html", "CSS.html",
      "Delphi.html", "FirstLine.html", "Index.html", "Java.html", "JavaScript.html",
      "NoControls.html", "NoGutter.html", "PHP.html", "Python.html", "Ruby.html",
      "ShowColumns.html", "SmartTabs.html", "SQL.html",
      "VB.html", "XML.html",
      "Scripts/clipboard.swf", "Scripts/shBrushCpp.js", "Scripts/shBrushCSharp.js",
      "Scripts/shBrushCss.js", "Scripts/shBrushDelphi.js", "Scripts/shBrushJava.js",
      "Scripts/shBrushJScript.js", "Scripts/shBrushPhp.js", "Scripts/shBrushPython.js",
      "Scripts/shBrushRuby.js", "Scripts/shBrushSql.js", "Scripts/shBrushVb.js",
      "Scripts/shBrushXml.js", "Scripts/shCore.js", "Scripts/shCore.uncompressed.js",
      "Styles/SyntaxHighlighter.css", "Styles/TestPages.css",
      "Templates/Test.dwt"
      ].each do |syntax|
        assert_generated_file "dp.SyntaxHighlighter/#{syntax}"
      end
    ["blank.gif", "bodybg.gif", "framing.css", "iepngfix.htc", "opera.css", "outline.css",
      "pretty.css", "print.css", "s5-core.css", "slides.css", "slides.js"].each do |asset|
        assert_generated_file "ui/default/#{asset}"
      end
  end

  private
  def sources
    [RubiGen::PathSource.new(:test, File.join(File.dirname(__FILE__),"..", generator_path))
    ]
  end

  def generator_path
    "app_generators"
  end
end
