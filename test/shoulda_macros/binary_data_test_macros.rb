module BinaryDataTestMacros
  def should_have_binary(name, *values)
    should "have binary_data #{name}" do
      assert_equal Array.new(values).flatten, subject.binary_data[name]
    end
  end
end

Test::Unit::TestCase.extend BinaryDataTestMacros
