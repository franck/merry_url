require 'rubygems'
require 'test/unit'
require 'shoulda'

require 'uri'
require 'net/http'

ROOT = File.join(File.dirname(__FILE__), '..')
require File.join(ROOT, 'lib', 'merry_url.rb')