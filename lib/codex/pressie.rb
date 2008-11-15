require 'yaml'

S5_HEAD = %{<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>&title;</title>
<!-- metadata -->
<meta name="generator" content="S5" />
<meta name="version" content="S5 1.1" />
<meta name="presdate" content="&date" />
<meta name="author" content="&author;" />
<meta name="organization" content="&organization;" />
<meta name="company" content="&company;" />
<!-- configuration parameters -->
<meta name="defaultView" content="slideshow" />
<meta name="controlVis" content="hidden" />
<!-- style sheet links -->
<link rel="stylesheet" href="../assets/ui/default/slides.css" type="text/css" media="projection" id="slideProj" />
<link rel="stylesheet" href="../assets/ui/default/outline.css" type="text/css" media="screen" id="outlineStyle" />
<link rel="stylesheet" href="../assets/stylesheets/print.css" type="text/css" media="print" id="slidePrint" />
<link rel="stylesheet" href="../assets/ui/default/opera.css" type="text/css" media="projection" id="operaFix" />

<link rel="stylesheet" href="../lib/stylesheets/pressie.css" type="text/css" />

<!-- S5 JS -->
<script src="../assets/ui/default/slides.js" type="text/javascript"></script>

<!-- Syntax Highlighter -->
<link rel="stylesheet"  href="../assets/dp.SyntaxHighlighter/Styles/SyntaxHighlighter.css"></link>

</head>
<body>

<div class="layout">
<div id="controls"><!-- DO NOT EDIT --></div>
<div id="currentSlide"><!-- DO NOT EDIT --></div>
<div id="header"></div>
<div id="footer">
<h2>Copyright &copy; &copyright;</h2>
</div>

</div>


<div class="presentation">
}

S5_TAIL = %{
  <!-- Syntax Highlighter -->
  <script language="javascript" src="../assets/dp.SyntaxHighlighter/Scripts/shCore.js"></script>
  <script language="javascript" src="../assets/dp.SyntaxHighlighter/Scripts/shBrushCpp.js"></script>
  <script language="javascript" src="../assets/dp.SyntaxHighlighter/Scripts/shBrushRuby.js"></script>
  <script language="javascript" src="../assets/dp.SyntaxHighlighter/Scripts/shBrushXml.js"></script>
  <script language="javascript">
  dp.SyntaxHighlighter.ClipboardSwf = '/flash/clipboard.swf';
  dp.SyntaxHighlighter.HighlightAll('code');
  </script>
</div>
</body>
</html>
}


module Codex
  class Pressie
    
    def initialize(metadata)
      @metadata = YAML.load_file(metadata)
    end

    def process(input, output)
      header = substitute_metadata_into(S5_HEAD)
      File.open(output, 'w') do |f|
        f.puts header, Content.new(input).to_html, S5_TAIL
      end
    end

  private

    def substitute_metadata_into(text)
      text = text.dup
      %w{author company organization date copyright title}.each do |key|
        text.gsub!(/&#{key};/, @metadata[key]) if @metadata.has_key?(key)
      end
      text
    end

  end
end
