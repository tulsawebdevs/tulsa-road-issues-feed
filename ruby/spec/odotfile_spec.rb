#odotfile_spec.rb

require './odotfile'

ODOT_TEST_FILE_NAME = "fri_oct_7.pdf"

describe OdotFile, "parse ODOT road closures PDF" do

  it "should store a filename on creation" do
    odot = OdotFile.new ODOT_TEST_FILE_NAME
    odot.filename.should.equal? ODOT_TEST_FILE_NAME
  end

  it "should provide an array of the lines of text in the file" do
    odot = OdotFile.new ODOT_TEST_FILE_NAME
    odot.parse
    odot.lines.should have_at_least(2).items
  end

end

describe OdotFile, "after parsing" do

  before(:each) do
    @odot = OdotFile.new ODOT_TEST_FILE_NAME
    @odot.parse
  end

  it "should not contain any pagination lines" do
    bad_lines = @odot.lines.grep /Page \d+ of \d/
      bad_lines.size.should == 0
  end

  it "should not contain any form feeds" do
    bad_lines = @odot.lines.grep /\f/
      bad_lines.size.should == 0
  end

  it "should not contain a header" do
    @odot.lines[0].should eql $closures_begin
  end

  it "should not contain a footer" do
    @odot.lines[-1].should eql $closures_end
  end

  it "should have an array of item array" do
    @odot.items.should have_at_least(1).item
    @odot.items[0].should be_an_instance_of Array
  end

  it "should not contain the header and footer marks in the items array" do
    @odot.items[0][0].should_not eql $closures_begin
    @odot.items[-1][0].should_not eql $closures_end
  end

  it "should not have empty items in the items array" do
    empties = @odot.items.select {|i| i.join("").empty?}
    empties.should have(0).items
  end

  it "should output the items as an array of strings" do
    @odot.items_as_strings[0].should be_an_instance_of String
  end


end
