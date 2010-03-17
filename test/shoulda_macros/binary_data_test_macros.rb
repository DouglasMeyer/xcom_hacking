module BinaryDataTestMacros
  def should_have_binary(name, *values)
    type = values.pop if values.last.is_a?(Symbol)
    type ||= :number
    should "have binary_data for #{name}" do
      values.flatten.each_with_index do |value, index|
        expected = {:name => name, :index => index, :type => type}
        assert_equal expected, subject.binary_data[value]
      end
    end
  end
end

Test::Unit::TestCase.extend BinaryDataTestMacros
