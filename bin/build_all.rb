# We're passed a file containing hyperlinks to the HTML
# (ie, table_con_contents.slides)
# and contruct all.slides from it

BASE = File.join(File.dirname(__FILE__), "..")
HEADER = %{h1. Advanced Ruby\n\nbq. Chad Fowler and Dave Thomas\n\nh1. Contents\n\n}


contents = File.readlines(ARGV[0]).grep(/^\*.*:(.*)\.html/) { File.join(BASE, "slides", "#{$1}.slides") }.map {|name| File.read(name) }

File.open(ARGV[1], "w") do |op|
  op.puts HEADER

  op.puts %{<div style="font-size: 70%">\n\n}

  contents.each do |content|
    content =~ /h1.\s+(.*)/
    STDERR.puts $1
    op.puts "* #{$1}\n\n"
  end

  op.puts "</div>\n\n"
  
  contents.each do |content|
    op.puts content.sub(/h1/, 'h1(slide0)').sub(/__END__.*/m, '')
  end
end