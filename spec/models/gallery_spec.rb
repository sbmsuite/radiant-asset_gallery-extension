require File.dirname(__FILE__) + '/../spec_helper'

describe Gallery do
  before(:each) do
    @gallery = Gallery.new
  end

  it "should be valid" do
    @gallery.should be_valid
  end
end
