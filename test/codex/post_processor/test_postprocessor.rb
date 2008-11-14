require File.expand_path(File.dirname(__FILE__) + '/../../test_helper.rb')

class Codex::PostProcessor::TestSlide < Test::Unit::TestCase
  INPUT = <<END
<h1>Heading</h1>
<p>paragraph</p>

<h2>Subheading</h2>
<p>paragraph</p>
END

  OUTPUT = <<END
<div class="slide"><h1>Heading</h1>
<p>paragraph</p>

</div><div class="slide"><h2>Subheading</h2>
<p>paragraph</p>
</div>
END

  def setup
    @postprocessor = Codex::PostProcessor::Slides.new(INPUT)
  end
  
  def test_process
    assert_equal OUTPUT.strip, @postprocessor.process!.strip
  end

end
