require "pressie/content" 
require 'yaml'

S5_HEAD = %{<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>&title;</title>
<!-- metadata -->
<meta name="generator" content="S5" />
<meta name="version" content="S5 1.1" />
<meta name="presdate" content="20050728" />
<meta name="author" content="&author;" />
<meta name="company" content="&company;" />
<!-- configuration parameters -->
<meta name="defaultView" content="slideshow" />
<meta name="controlVis" content="hidden" />
<!-- style sheet links -->
<link rel="stylesheet" href="../ui/default/slides.css" type="text/css" media="projection" id="slideProj" />
<link rel="stylesheet" href="../ui/default/outline.css" type="text/css" media="screen" id="outlineStyle" />
<link rel="stylesheet" href="../lib/stylesheets/print.css" type="text/css" media="print" id="slidePrint" />
<link rel="stylesheet" href="../ui/default/opera.css" type="text/css" media="projection" id="operaFix" />

<link rel="stylesheet" href="../lib/stylesheets/pressie.css" type="text/css" />

<!-- S5 JS -->
<script src="../ui/default/slides.js" type="text/javascript"></script>

<!-- Syntax Highlighter -->
<link rel="stylesheet"  href="../dp.SyntaxHighlighter/Styles/SyntaxHighlighter.css"></link>

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
  <script language="javascript" src="../dp.SyntaxHighlighter/Scripts/shCore.js"></script>
  <script language="javascript" src="../dp.SyntaxHighlighter/Scripts/shBrushCpp.js"></script>
  <script language="javascript" src="../dp.SyntaxHighlighter/Scripts/shBrushRuby.js"></script>
  <script language="javascript" src="../dp.SyntaxHighlighter/Scripts/shBrushXml.js"></script>
  <script language="javascript">
  dp.SyntaxHighlighter.ClipboardSwf = '/flash/clipboard.swf';
  dp.SyntaxHighlighter.HighlightAll('code');
  </script>
</div>
</body>
</html>
}


class Pressie
  
  def self.process
    new.process
  end
  
  def process    
    metadata_name = ARGV.shift || usage("Missing metadata file name")
    load_metadata(metadata_name)
    input_name = ARGV.shift || usage("Missing input file name")
    content = Content.new(File.read(input_name)) rescue usage($!.message)  
    header = substitute_metadata_into(S5_HEAD)
    puts header, content.to_html, S5_TAIL
  end
  
  
  private
  
  def usage(msg = nil)
    STDERR.puts "pressie.rb  <metadatafile> <inputfile>"
    if msg
      STDERR.puts
      STDERR.puts msg
    end
    exit 1
  end                                     
  
  def load_metadata(file_name)
    @metadata = YAML.load_file(file_name)
  end          
  
  def substitute_metadata_into(text)
    text = text.dup
    %w{author company copyright title}.each do |key|
      text.gsub!(/&#{key};/, @metadata[key]) if @metadata.has_key?(key)
    end
    text
  end
      
end