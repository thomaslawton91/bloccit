require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }

  let(:topic) { Topic.create!(name: name, description: description) }
  let(:sponsored_post) { topic.sponsored_posts.create!(title: "Title", body: "Body", price: 0) }

  describe "attributes" do
    it "has expected attributes" do
      expect(sponsored_post).to have_attributes(title: "Title", body: "Body", price: 0)
    end
  end
end
