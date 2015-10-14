require 'fileutils'

FileUtils::mkdir_p 'hack/sample_folder'

def file_create(filename = 'test_sample.rb')
  end_file = File.new(filename, 'w')
  end_file.puts('puts "Hello world"')
  end_file.close
end


file_create('sample_test.rb')
