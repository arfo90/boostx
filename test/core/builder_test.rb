require_relative '../testBase'
require 'fakefs'

class TestCoreBuilder < TestBase
  def test_class_exist
    builder = Boost::Core::Builder.new
  end

  def test_method_make_dir_create_folder
    builder = Boost::Core::Builder.new.make_dir('create_new_folder')
    assert File.directory?('create_new_folder'), 'make_dir method failed to create folder'
  end

  def test_method_make_file_create_file
    builder = Boost::Core::Builder.new.make_file('crete_new_file')
    assert File.file?('crete_new_file.rb'), 'make_file method failed to create file'
  end
  
  def refrence
  Boost::Core::Builder.any_instance
      .expects(:make_dir)
      .once
  end

end
