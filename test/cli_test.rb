require_relative 'testBase'

class TestCli < TestBase
  def test_command_init_calls_builder_init
    builder = mock
    Boostx::Core::Builder
      .stubs(:new)
      .returns(builder)

    builder.expects(:init)
      .once

    Boostx::Cli.new.init('project_name')
  end
end
