class OdotFile 
  attr :filename
  attr_reader :lines, :items

  $closures_begin = "The projects below are all weather permitting:"
  $closures_end = "_" * 74


  def initialize filename
    @filename = filename
    @lines = []
    @items = []
  end

  def parse
    (bad, good) = `pdftotext #{filename} -`.split( "\n").partition do |line|
       line =~ /(Page \d+ of \d)|\f/
    end

    @lines = good.slice good.index($closures_begin)..-1
    @lines.slice! (@lines.index($closures_end)+1)..-1

    @items = (@lines.chunk {|s| s.empty?}).map {|_, i| i}

    # remove the header and footer markers
    @items.shift
    @items.pop

    @items.select! {|i| ! i.join("").empty? }
  end

  def items_as_strings
    @items.map {|i| i.join("")}
  end


end
