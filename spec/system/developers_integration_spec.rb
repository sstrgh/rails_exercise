require "rails_helper"

RSpec.describe "Developers Table", type: :system do
  it "User visits index" do

    developer1 = FactoryBot.build(:developer)
    developer2 = FactoryBot.build(:developer)
    developer3 = FactoryBot.build(:developer)

    visit root_path

    expect(page).to have_content "Developers - All"

  end
end
