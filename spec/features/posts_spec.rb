require 'rails_helper'

RSpec.describe 'Posts', type: :feature, clean: true do
  describe '#index' do
    let!(:post_1) { FactoryBot.create(:post) }
    let!(:post_2) { FactoryBot.create(:post) }
    let!(:post_3) { FactoryBot.create(:post) }

    it 'lists all posts' do
      visit '/posts'

      expect(page).to have_content(post_1.title)
      expect(page).to have_content(post_2.title)
      expect(page).to have_content(post_3.title)
    end
  end

  describe '#show' do
    let!(:post) { FactoryBot.create(:post) }

    it 'shows a single post' do
      visit "/posts/#{post.id}"

      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end

  describe '#create' do
    let!(:subdevvit) { FactoryBot.create(:subdevvit) }

    it 'creates a new post' do
      visit '/posts/new'

      fill_in('Title', with: 'New Post Title')
      select(subdevvit.name, from: 'Subdevvit')
      fill_in('Text', with: 'New Post Text')
      expect { click_button 'Create Post' }.to change(Post, :count).by(1)

      expect(page).to have_content('Post was successfully created.')
      expect(page).to have_content('New Post Title')
      expect(page).to have_content('New Post Text')
    end
  end

  describe '#edit' do
    let!(:post) { FactoryBot.create(:post) }

    it 'edits an existing post' do
      visit "/posts/#{post.id}/edit"

      fill_in('Title', with: 'Edited Post Title')
      fill_in('Text', with: 'Edited Post Text')
      click_button 'Update Post'

      expect(page).to have_content('Post was successfully updated.')
      expect(page).to have_content('Edited Post Title')
      expect(page).to have_content('Edited Post Text')
    end
  end

  describe '#destroy', js: true do
    let!(:post) { FactoryBot.create(:post) }

    it 'deletes a post' do
      visit '/posts'

      accept_confirm { find("[data-id='#{post.id}']").find("[data-method='delete']").click }

      expect(page).to have_content('Post was successfully destroyed.')
      expect(page).not_to have_content(post.title)
    end
  end
end
