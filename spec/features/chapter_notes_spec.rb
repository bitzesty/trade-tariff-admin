require 'spec_helper'

describe "Chapter Note management" do
  let!(:user)    { create :user }
  let!(:chapter) { create :chapter }

  describe "Chapter Note creation" do
    let(:chapter_note) { build :chapter_note }

    it 'can be created' do
      verify_note_not_created_for chapter

      create_note note: chapter_note,
                  chapter: chapter

      verify_note_created_for ChapterNote.last
    end
  end

  describe "Chapter Note editing" do
    let!(:chapter_note) { create :chapter_note }

    it 'can be updated' do
      verify_note_created_for chapter_note

      update_note note: chapter_note,
                  content: 'Hello World'

      verify_note_updated_for chapter_note, content: 'Hello World'
    end
  end

  describe "Chapter Note deletion" do
    let!(:chapter_note) { create :chapter_note }

    it 'can be removed' do
      verify_note_created_for chapter_note

      remove_note chapter_note

      verify_note_not_created_for chapter_note.chapter
    end
  end

  private

  def verify_note_not_created_for(chapter)
    visit root_path
    page.should_not have_content chapter.goods_nomenclature_item_id
  end

  def create_note(args = {})
    visit new_chapter_note_path

    select args[:chapter], from: 'chapter_note_chapter_id'
    fill_in 'chapter_note_content', with: args[:note].content

    click_button 'Create Chapter note'
  end

  def update_note(args = {})
    visit edit_chapter_note_path(args[:note])

    fill_in 'chapter_note_content', with: args[:content]

    click_button 'Update Chapter note'
  end

  def remove_note(chapter_note)
    visit root_path

    within('table.table-chapter-notes') do
      click_link 'Remove'
    end
  end

  def verify_note_updated_for(chapter_note, args = {})
    visit edit_chapter_note_path(chapter_note)
    page.should have_field('chapter_note_content', with: args[:content])
  end

  def verify_note_created_for(chapter_note)
    visit edit_chapter_note_path(chapter_note)
    page.should have_field('chapter_note_chapter_id_fk', with: chapter_note.chapter.goods_nomenclature_item_id)
  end
end
