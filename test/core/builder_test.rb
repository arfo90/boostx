require_relative '../testBase'

class TestCoreBuilder < TestBase
  def test_class_exist
    builder = Boost::Core::Builder.new
  end
end
