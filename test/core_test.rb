require_relative 'testBase'

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
    YAML::Store.any_instance
      .stubs(:transaction)

    builder = Boostx::Core::Builder.new.init('project_name')
    assert File.directory?('lib'), 'init method failed to create folder'
    assert File.directory?('lib/project_name'), 'init method failed to create folder'

    # assert File.file?('Gemfile'), 'init method failed to create file Gemfile'
    assert File.file?('lib/project_name.rb'), 'init method failed to create file lib/project_name.rb'
  end

  def test_method_init_create_calls_yaml_store
    yaml_service = mock
    YAML::Store
      .expects(:new)
      .returns(yaml_service)

    yaml_service.stubs(:transaction)  
        
    builder = Boostx::Core::Builder.new.init('project_name')
  end
   
  def test_method_init_create_calls_yaml_store_calls_transaction
    yaml_creator = mock
    YAML::Store
      .stubs(:new)
      .returns(yaml_creator)

    yaml_creator.expects(:transaction)
      .once

    builder = Boostx::Core::Builder.new.init('project_name')
  end

  def test_method_rbfile_exists
    builder = Boostx::Core::Builder.new.rb_file('new_file')
  end

  def test_method_rbfile_calls_makefile
    builder = Boostx::Core::Builder.new.rb_file('new_file')
    assert File.file?('new_file.rb'), 'new_file.rb method failed to create file'
  end

  def refrence
  Boostx::Core::Builder.any_instance
      .expects(:make_dir)
      .once
  end

end

######### Template test ########
class TestTemplate < TestBase
  def test_tempalte_class_exists
    template = Boostx::Core::Template.new
  end
  
  def test_basic_module_struc_retuns_basic_module_generated_code
    expected_generated_code = "$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))\nrequire 'rubygems'\n"
    expected_generated_code << "require 'bundler/setup'\nBundler.require(:default)\n\nmodule Sample\n\s## autoload classes here\nend"
    actual_code = Boostx::Core::Template.base_module_struc('Sample')
    assert expected_generated_code.to_s == actual_code.to_s, 'Generated basic module is not correct' 
  end
end
