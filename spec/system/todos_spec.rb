require 'rails_helper'

RSpec.describe "Todos", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:todo) { build(:todo) }
  describe '登録' do
    context '成功' do
      it 'todoを登録' do
        visit new_todo_path
        fill_in 'Name', with: todo.name
        fill_in 'Description', with: todo.description
        click_button '投稿'
        expect(page).to have_content todo.name
        # binding.pry
      end
    end
  end
end
