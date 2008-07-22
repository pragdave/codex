# This is _my_ example filter. Define your own ;-)

class TestFilter < Codex::Filter
  tag :test

  def filter_inline(text,args)
    text.reverse
  end

  def filter_single(args)
    args.reverse
  end
end