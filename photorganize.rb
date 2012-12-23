#!/usr/bin/ruby

require 'fileutils'
require 'rubygems'
require 'mini_exiftool'

class Photorganize

  @@origin_dir = ''
  @@destination_dir = ''

  def self.read_params
    if ARGV.size != 2 
      puts 'Usage: photorganize origin_directory destination_directory'
      exit
    end
    @@origin_dir = ARGV[0]
    @@destination_dir = ARGV[1]
    if !File.exist? @@origin_dir
      puts "#{@@origin_dir} not found !"
      exit
    end
    Dir.mkdir @@destination_dir unless File.exist? @@destination_dir
  end

  def self.organize!
    files = Dir["#{@@origin_dir}/*JPG","#{@@origin_dir}/*jpg","#{@@origin_dir}/*cr2","#{@@origin_dir}/*CR2"]
    puts "Number of Photos: #{files.size}"

    files.each do |file_name|
      photo = MiniExiftool.new file_name
      create_date = photo.create_date

      date_dir = File.join @@destination_dir, create_date.strftime('%Y-%m-%d')

      Dir.mkdir(date_dir) unless File.exist? date_dir

      dest_file = File.join date_dir, File.basename(file_name)

      #puts "Dest File #{dest_file}" 
      #puts "Dest File #{File.basename(file_name)}"

      if File.exist? dest_file
        puts "File #{dest_file} already exists !"
      else
        puts "Copying #{file_name} to #{date_dir} ..."
        FileUtils.cp(file_name, date_dir) #unless File.exit? "#{date_dir}/#{file}" 
      end 
    
    end

  end
end

Photorganize.read_params
Photorganize.organize!
