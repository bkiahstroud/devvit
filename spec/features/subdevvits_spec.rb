require 'rails_helper'

RSpec.describe 'Subdevvits', type: :feature, clean: true do
  describe '#index' do
    let!(:subdevvit_1) { FactoryBot.create(:subdevvit) }
    let!(:subdevvit_2) { FactoryBot.create(:subdevvit) }
    let!(:subdevvit_3) { FactoryBot.create(:subdevvit) }

    it 'lists all subdevvits' do
      visit '/subdevvits'

      expect(page).to have_content(subdevvit_1.name)
      expect(page).to have_content(subdevvit_2.name)
      expect(page).to have_content(subdevvit_3.name)
    end
  end

  describe '#show' do
    let(:subdevvit) { FactoryBot.create(:subdevvit) }
    let!(:post_1) { FactoryBot.create(:post, subdevvit: subdevvit) }
    let!(:post_2) { FactoryBot.create(:post) }

    it 'shows all the posts in that subdevvit' do
      visit "/subdevvits/#{subdevvit.id}"

      expect(page).to have_content(post_1.title)
      expect(page).not_to have_content(post_2.title)
    end
  end

  describe '#create' do
    let!(:subdevvit) { FactoryBot.create(:subdevvit) }

    it 'creates a new subdevvit' do
      visit '/subdevvits/new'

      fill_in('Name', with: 'New Subdevvit Name')
      fill_in('Description', with: 'New Subdevvit Description')
      expect { click_button 'Create Subdevvit' }.to change(Subdevvit, :count).by(1)

      expect(page).to have_content('Subdevvit was successfully created.')
    end
  end

  describe '#edit' do
    let!(:subdevvit) { FactoryBot.create(:subdevvit) }

    it 'edits an existing subdevvit' do
      visit "/subdevvits/#{subdevvit.id}/edit"

      fill_in('Name', with: 'Edited Subdevvit Name')
      fill_in('Description', with: 'Edited Subdevvit Description')
      click_button 'Update Subdevvit'

      expect(page).to have_content('Subdevvit was successfully updated.')
    end
  end

  describe '#destroy', js: true do
    let!(:subdevvit) { FactoryBot.create(:subdevvit) }

    it 'deletes a subdevvit' do
      visit '/subdevvits'

      accept_confirm { find("[data-id='#{subdevvit.id}']").find("[data-method='delete']").click }

      expect(page).to have_content('Subdevvit was successfully destroyed.')
      expect(page).not_to have_content(subdevvit.name)
    end
  end
end
