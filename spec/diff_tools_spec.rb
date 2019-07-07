describe CompareFiles::DiffTools do
  describe ".new_right" do
    subject { described_class }

    it "displays items on the right missing from the left" do
      left = [1,2,3]
      right = [1,4]
      expect(subject.new_right(left, right)).to eq([4])
    end
  end

  describe ".new_left" do
    subject { described_class }

    it "displays items on the left missing from the right" do
      left = [1,2,3]
      right = [1,4]
      expect(subject.new_left(left, right)).to eq([2,3])
    end
  end
end
