require "rails_helper"

RSpec.describe "Developers Table", type: :system do

  it "User visits index" do
    visit root_path

    expect(page).to have_content "Programming language"
    expect(page).to have_content "Communication language"

    expect(page).to have_content "Developers - All"
    expect(page).to have_css 'table'

    # Page has got no developer data
    within 'table' do
      within 'tbody' do
        expect(page).not_to have_xpath 'tr'
      end
    end

    # Added developers into database
    developer1 = FactoryBot.create(:developer)
    developer2 = FactoryBot.create(:developer)
    developer3 = FactoryBot.create(:developer)

    developer1.languages << FactoryBot.create(:language, :vietnamese)
    developer1.programming_languages << FactoryBot.create(:programming_language, :ruby)


    # Refreshed site
    visit root_path

    within 'table' do
      # Check if table has rows that match the rows in the db
      within 'tbody' do
        expect(page).to have_xpath 'tr', :count => 3

        # Check if the first row has the language details of the first developer
        within 'tr[1]' do
          expect(page).to have_content 'Ruby'
          expect(page).to have_content 'vn'
        end
      end

      # Check if all emails appear
      Developer.all.each do |dev|
        expect(page).to have_text dev.email
      end
    end

  end # End of 'User visits index' test

  it "User searches for Ruby developers" do
    # Added developers into database
    developer1 = FactoryBot.create(:developer)
    developer2 = FactoryBot.create(:developer)
    developer3 = FactoryBot.create(:developer)

    developer1.languages << FactoryBot.create(:language, :vietnamese)
    developer1.programming_languages << FactoryBot.create(:programming_language, :ruby)

    visit root_path

    fill_in('pl_term', :with => 'ruby')
    click_button('Search')

    expect(page).to have_content "Developers - ruby"

    within 'table' do
      # Check if table has rows that match the rows in the db
      within 'tbody' do
        expect(page).to have_xpath 'tr', :count => 1

        # Check if the first row has the language details of the first developer
        within 'tr[1]' do
          expect(page).to have_content 'Ruby'
          expect(page).to have_content 'vn'
        end
      end
    end

  end # End of 'User visits index' test



end
