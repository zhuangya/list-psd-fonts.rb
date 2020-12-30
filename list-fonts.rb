#!/usr/bin/env ruby
require 'psd'
file = ARGV[0]
psd = PSD.new(file)
psd.parse!

result = []
psd.tree.descendant_layers.each do |l|
  begin
    next unless l.layer[:text]

    result |= l[:text][:font][:fonts]
  rescue StandardError
    warn "something went wrong on layer: #{l[:name]}"
  end
end

puts result.sort.join("\n")
