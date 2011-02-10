#!/usr/bin/ruby

require "yaml"

# Filename    : dawn.rb
# Created     : 2011-01-10
# Description : Keep a track of what you've done in a fast and single command line.
# Author      : Taurus Olson <taurusolson@gmail.com>

FILE = File.join(ENV['DROP'], 'dawn.yml')

def print_info(entry)
    if entry['tags']
        puts "- [#{entry['date']}] #{entry['done']} |#{entry['tags'].join ', '}|"
    else
        puts "- [#{entry['date']}] #{entry['done']}"
    end
end

def read_tags(entry)
    puts entry['tags'].join ', '
end

def write_info(file, msg, tags)

    t = Time.new
    today = "#{t.day}/#{t.month}/#{t.year - 2000}"
    f = File.open(file, 'a')
    f.write("\n- date: #{today}\n")
    f.write("  done: #{msg}\n")
    f.write("  tags: [#{tags.join ', '}]\n")
end


# Display what has been done so far
if ARGV.size == 0
    f     = File.read FILE
    r_obj = YAML::load(f)

    r_obj['dawn'].each do |entry|
        print_info entry
    end
end


# Enter a new thing done
if ARGV.size > 1
    msg = ARGV[0]
    tags = ARGV[1..-1]
    write_info(FILE, msg, tags)
end

if ARGV.size == 1 and ARGV[0] != "|"
    tag = ARGV[0]
    f     = File.read FILE
    r_obj = YAML::load(f)

    r_obj['dawn'].each do |entry|
        if entry['tags']
            entry['tags'].each do |t|
                if t.to_s.start_with? tag
                    print_info entry
                end
            end
        end

        # if entry['tags'].start_with? tag
            # print_info entry
        # end
    end
end
