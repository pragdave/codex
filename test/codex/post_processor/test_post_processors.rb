require File.expand_path(File.dirname(__FILE__) + '/../../test_helper.rb')

class TemporaryPostProcessor < Codex::PostProcessor
  def process
    @html << "TemporaryPostProcessor was here!"
  end
end

class Codex::TestPostProcessors < Test::Unit::TestCase
  INPUT = <<END
<div class="slide"><h1 class="slide0">Heading</h1>
<p>paragraph</p>

</div>
<div class="slide"><h1>heading</h1>
<p>paragraph</p>
</div>
<div class="slide"><h1 class="slide0">heading</h1>
<p>paragraph</p>
</div>
END

  def setup
    @postprocessors = Codex::PostProcessors.instance
    @postprocessors << TemporaryPostProcessor
  end
  
  def teardown
    @postprocessors.delete(TemporaryPostProcessor)
  end
  
  def test_process_all
    output = @postprocessors.process_all(INPUT)
    assert  output.index("<p>paragraph</p>")
  end
  
  def test_newly_registered_post_process_works
    output = @postprocessors.process_all(INPUT)
    assert  output.index("TemporaryPostProcessor was here!")
  end

end
