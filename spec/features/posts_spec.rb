# frozen_string_literal: true

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

  describe '#new' do
    it 'renders the New Post form' do
      visit new_post_url

      expect(page).to have_content('Title')
      expect(page).to have_content('Text')
      expect(page).to have_button('Create Post')
    end
  end

  describe '#edit' do
    let!(:post) { FactoryBot.create(:post) }

    it 'edits the requested post' do
      visit edit_post_path(post)

      expect(find('input#post_title').value).to eq(post.title)
      expect(page).to have_select('Subdevvit', selected: post.subdevvit.name)
      expect(find('textarea#post_text').text).to eq(post.text)
      expect(page).to have_button('Update Post')
    end
  end

  describe '#create' do
    let!(:subdevvit) { FactoryBot.create(:subdevvit) }

    context 'with valid form inputs' do
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

    context 'with invalid form inputs' do
      it 'does not create a new Post' do
        visit '/posts/new'
        expect { click_button 'Create Post' }.to change(Post, :count).by(0)
        expect(page).to have_content('Please review the problems below:')
        expect(page).to have_content("Title can't be blank")
      end
    end
  end

  describe '#update' do
    let!(:post) { FactoryBot.create(:post) }

    context 'with valid form inputs' do
      it 'edits the requested post' do
        visit "/posts/#{post.id}/edit"

        fill_in('Title', with: 'Edited Post Title')
        fill_in('Text', with: 'Edited Post Text')
        click_button 'Update Post'

        expect(page).to have_content('Post was successfully updated.')
        expect(page).to have_content('Edited Post Title')
        expect(page).to have_content('Edited Post Text')
      end
    end

    context 'with invalid form inputs' do
      it 'does not update the requested post' do
        visit "/posts/#{post.id}/edit"

        fill_in('Title', with: '')
        click_button 'Update Post'

        expect(page).to have_content('Please review the problems below:')
        expect(page).to have_content("Title can't be blank")
        # expect attributes to have not changed from their original values
        post.reload
        expect(post.title).to eq(post.title)
        expect(post.text).to eq(post.text)
      end
    end
  end

  describe '#destroy', js: true do # need js to use #accept_confirm
    let!(:post) { FactoryBot.create(:post) }

    it 'deletes a post' do
      visit '/posts'

      accept_confirm { find("[data-id='#{post.id}']").find("[data-method='delete']").click }

      expect(page).to have_content('Post was successfully destroyed.')
      expect(page).not_to have_content(post.title)
    end
  end
end
