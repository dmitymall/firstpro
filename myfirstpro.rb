#!/usr/bin/env ruby
require 'digest'
require 'ostruct'

class HashAnalyzer
  def initialize(data)
    @data = data
  end

  def file_info
    @data.map { |i| OpenStruct.new(:name => i.match(/(.\/.*\/)([^\\]+)/)[2], :md5=> Digest::MD5.hexdigest(File.open(i).read))}
  end

  def repeat

  end

  def files_names

  end

end

class Program
  def initialize
    @pattern = /(.{1,2})(\/[a-z_\-\s0-9\.]+)+\//
  end

  def is_correct_path(path)
    @pattern.match?(path)
  end

  def run
    params = ARGV[0]
      if(!is_correct_path(params))
        puts "you should input correct path"
        else
          file_info = Dir.glob(params+"*")
          if file_info.length == 0
            puts "There is no files in this folder"
          else
            hash_analyzer = HashAnalyzer.new(file_info)
            puts hash_analyzer.get_file_info
         end
      end
  end

end

a = Program.new
a.run


