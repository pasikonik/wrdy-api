# frozen_string_literal: true

RSpec.describe AddUser do
  let(:interactor) { AddUser.new }
  let(:attributes) { Hash[email: "john@lock.com", password: "taczka123"] }

  context "good input" do
    let(:result) { interactor.call(attributes) }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end

    it "creates a Book with correct title and author" do
      expect(result.book.title).to eq("john@lock.com")
      expect(result.book.author).to eq("taczka123")
    end
  end
end
