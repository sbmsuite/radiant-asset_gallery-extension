require File.dirname(__FILE__) + '/../spec_helper'

describe GalleryItem do
  before(:each) do
    @gallery_item = GalleryItem.new
  end

  it "should be valid" do
    @gallery_item.should be_valid
  end
end
