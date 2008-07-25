require File.expand_path(File.dirname(__FILE__) + '/../test_helper.rb')

module Codex
  class TestTemplateHandler < Test::Unit::TestCase

    def test_textile_handler
      handler = TemplateHandler.choose('foo.textile')
      assert_kind_of Proc, handler
      assert_equal '<h1>Foo</h1>', handler.call('h1. Foo')
    end

    def test_markdown_handler
      handler = TemplateHandler.choose('foo.markdown')
      assert_kind_of Proc, handler
      assert_equal '<h1>Foo</h1>', handler.call('# Foo')
    end
    
    def test_unkown_handler
      assert_equal 'bar', TemplateHandler.choose('foo.txt').call('bar')
    end
    
    def test_register_custom
      TemplateHandler.register(:reverse) {|c| c.reverse }
      assert_equal 'esrever', TemplateHandler.choose('foo.reverse').call('reverse')
    end
    
  end
end
