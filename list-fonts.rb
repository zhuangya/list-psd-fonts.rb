#!/usr/bin/env ruby
require 'psd'
file = ARGV[0]
psd = PSD.new(file)
psd.parse!

result = []
psd.tree.descendant_layers.each do |l|
  next unless l[:text]

  result |= l[:text][:font][:fonts]
end

pp result
