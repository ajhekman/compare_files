RSpec.describe CompareFiles::Helpers do

  describe ".split_lines" do
    subject { described_class.split_lines( example_string )}

    let(:example_string) { ['removes', 'extra', '', 'linebreaks', '  and spaces  '].join("\n") }

    it "strips extra whitespace" do
      expected = ['removes','extra', 'linebreaks', 'and spaces']
      puts subject
      expect(subject).to eq(expected)
    end
  end
end

