# frozen_string_literal: true

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

  describe '#new' do
    it 'renders the New Subdevvit form' do
      visit new_subdevvit_url

      expect(page).to have_content('New Subdevvit')
      expect(page).to have_content('Name')
      expect(page).to have_content('Description')
      expect(page).to have_button('Create Subdevvit')
    end
  end

  describe '#edit' do
    let!(:subdevvit) { FactoryBot.create(:subdevvit) }

    it 'edits the requested subdevvit' do
      visit "/subdevvits/#{subdevvit.id}/edit"

      expect(find('input#subdevvit_name').value).to eq(subdevvit.name)
      expect(find('input#subdevvit_description').value).to eq(subdevvit.description)
      expect(page).to have_button('Update Subdevvit')
    end
  end

  describe '#create' do
    context 'with valid form inputs' do
      it 'creates a new subdevvit' do
        visit '/subdevvits/new'

        fill_in('Name', with: 'New Subdevvit Name')
        fill_in('Description', with: 'New Subdevvit Description')
        expect { click_button 'Create Subdevvit' }.to change(Subdevvit, :count).by(1)

        expect(page).to have_content('Subdevvit was successfully created.')
      end
    end

    context 'with invalid form inputs' do
      it 'does not create a new subdevvit' do
        visit '/subdevvits/new'

        expect { click_button 'Create Subdevvit' }.to change(Subdevvit, :count).by(0)

        expect(page).to have_content('Please review the problems below:')
        expect(page).to have_content("Name can't be blank")
      end
    end
  end

  describe '#update' do
    let!(:subdevvit) { FactoryBot.create(:subdevvit) }

    context 'with valid form inputs' do
      it 'updates the requested subdevvit' do
        visit "/subdevvits/#{subdevvit.id}/edit"

        fill_in('Name', with: 'Edited Subdevvit Name')
        fill_in('Description', with: 'Edited Subdevvit Description')
        click_button 'Update Subdevvit'

        expect(page).to have_content('Subdevvit was successfully updated.')
        subdevvit.reload
        expect(subdevvit.name).to eq('Edited Subdevvit Name')
        expect(subdevvit.description).to eq('Edited Subdevvit Description')
      end
    end

    context 'with invalid form inputs' do
      it 'does not update the requested subdevvit' do
        visit "/subdevvits/#{subdevvit.id}/edit"

        fill_in('Name', with: '')
        click_button 'Update Subdevvit'

        expect(page).to have_content('Please review the problems below:')
        expect(page).to have_content("Name can't be blank")
        # expect attributes to have not changed from their original values
        subdevvit.reload
        expect(subdevvit.name).to eq(subdevvit.name)
        expect(subdevvit.description).to eq(subdevvit.description)
      end
    end
  end

  describe '#destroy', js: true do # need js to use #accept_confirm
    let!(:subdevvit) { FactoryBot.create(:subdevvit) }

    it 'deletes a subdevvit' do
      visit '/subdevvits'

      accept_confirm { find("[data-id='#{subdevvit.id}']").find("[data-method='delete']").click }

      expect(page).to have_content('Subdevvit was successfully destroyed.')
      expect(page).not_to have_content(subdevvit.name)
    end
  end
end
