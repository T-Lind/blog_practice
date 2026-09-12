require "rails_helper"

RSpec.describe "seeded test database" do
  it "includes the five users from db/seeds.rb" do
    expect(User.where(last_name: %w[Lovelace Turing Hopper Dijkstra Knuth]).count).to eq(5)
  end
end
