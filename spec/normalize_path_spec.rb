require 'spec_helper.rb'
require '../normalize_path.rb'

Rspec.describe "normalize path" do
  
  let test_path1 = "foo/./bar"
  let test_path2 = "foo/bar/../baz"

  it "removed sigle dot from path" do
    expect(normalize(test_path1)).to eq('foo/bar')
  end
  
  it "remove double dot from path" do
    expect(normalize(test_path2)).to eq('foo/baz')
  end
end
