#!/usr/bin/env ruby

require_relative 'helpers/tld'
require_relative 'lib/word'
require_relative 'lib/page'
require_relative 'lib/job'
require_relative 'lib/parse'

def run!
  Parse.new().execute!
end

if $0 == __FILE__
  run!
end
