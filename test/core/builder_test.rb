require_relative '../testBase'
require 'fakefs'
class TestCoreBuilder < TestBase
  def test_class_exist
    builder = Boostx::Core::Builder.new
  end

  def test_method_make_dir_create_folder
    builder = Boostx::Core::Builder.new.make_dir('create_new_folder')
    assert File.directory?('create_new_folder'), 'make_dir method failed to create folder'
  end

  def test_method_make_file_create_file
    builder = Boostx::Core::Builder.new.make_file('crete_new_file')
    assert File.file?('crete_new_file.rb'), 'make_file method failed to create file'
  end

  def test_method_init
    builder = Boostx::Core::Builder.new.init('project_name')
    assert File.directory?('lib'), 'init method failed to create folder'
    assert File.directory?('lib/project_name'), 'init method failed to create folder'

    # assert File.file?('Gemfile'), 'init method failed to create file Gemfile'
    assert File.file?('lib/project_name.rb'), 'init method failed to create file lib/project_name.rb'
  end

  def refrence
  Boostx::Core::Builder.any_instance
      .expects(:make_dir)
      .once
  end

end
