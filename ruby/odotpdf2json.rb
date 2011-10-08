#!/usr/bin/env ruby 


require './odotfile'
require 'optparse'
require 'json'

options = {}

optparse = OptionParser.new do |opts|

  opts.banner = "Usage: #{__FILE__} input.pdf [output.json]"

   opts.on_tail( '-h', '--help', 'Display this screen' ) do
     puts opts
     exit
   end

end

optparse.parse!

pdf = ARGV.shift
jsn = ARGV.shift

if pdf != nil and File::exist? pdf
  odot = OdotFile.new pdf

  if jsn != nil 
    output = File.new jsn, "w"
    output.write odot.items_to_strings.to_json
    output.close
  else
    puts odot.items_to_strings.to_json
  end
end
