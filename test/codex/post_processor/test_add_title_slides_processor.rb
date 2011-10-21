require File.expand_path(File.dirname(__FILE__) + '/../../test_helper.rb')

class Codex::TestSlideProcessor < Test::Unit::TestCase
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

  OUTPUT = <<END
<div class="title slide">
<h1>Heading</h1>
<p>paragraph</p>

</div>
<div class="slide"><h1>heading</h1>
<p>paragraph</p>
</div>
<div class="title slide">
<h1>heading</h1>
<p>paragraph</p>
</div>
END

  def setup
    @postprocessor = Codex::AddTitleSlides.new(INPUT)
  end

  def test_process
    @postprocessor.process
    assert_equal OUTPUT.strip, @postprocessor.html.strip
  end

end
