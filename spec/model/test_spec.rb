require 'rails_helper'

RSpec.describe Micropost, type: :model do
  describe "search posts by term" do
    context "when no post is found" do
      it "returns an empty collection" do
        expect(Micropost.find_by(name: "Example User")).to be_empty
      end
    end
  end
end
