require 'spec_helper.rb'
require '../normalize_path.rb'

Rspec.describe "normalize path" do

  let test_path1 = "foo/./bar"
  let test_path2 = "foo/bar/../baz"
  let test_path3 = "..foo/bar../baz"
  let test_path4 = "foo//bar"

  it "removed sigle dot from path" do
    expect(normalize(test_path1)).to eq('foo/bar')
  end
  
  it "remove double dot from path" do
    expect(normalize(test_path2)).to eq('foo/baz')
    expect(normalize(test_path3)).to eq('../foo/baz')
  end

  it "will not perform any other normalization" do
    expect(normalize(test_path4)).to eq('../foo/baz')
  end

end
