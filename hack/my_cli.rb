require 'thor'

class MyCli < Thor
  desc 'hello, just test', 'say hello'
  option :from
  def hello(name)
    puts name
    puts "from #{options[:from]}" if options[:from]
  end
end

MyCli.start(ARGV)
