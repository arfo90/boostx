require_relative 'testBase'

class TestCli < TestBase
  def test_command_init_calls_builder_init
    builder = mock
    Boost::Core::Builder
      .stubs(:new)
      .returns(builder)

    builder.expects(:init)
      .once

    Boost::Cli.new.init('project_name')
  end
end
