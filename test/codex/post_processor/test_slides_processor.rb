require File.expand_path(File.dirname(__FILE__) + '/../../test_helper.rb')

class Codex::TestSlidesProcessor < Test::Unit::TestCase
  INPUT = <<END
<h1>Heading</h1>
<p>paragraph</p>

<h2>Subheading</h2>
<p>paragraph</p>
END

  OUTPUT = <<END
<div class="slide"><h1>Heading</h1>
<p>paragraph</p>

</div>
<div class="slide"><h2>Subheading</h2>
<p>paragraph</p>
</div>
END

  def setup
    @postprocessor = Codex::SlidesProcessor.new(INPUT)
  end

  def test_process
    @postprocessor.process
    assert_equal OUTPUT.strip, @postprocessor.html.strip
  end

end
