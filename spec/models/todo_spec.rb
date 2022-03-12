require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe '#create' do
    let(:todo) { build(:todo) }
    context '成功' do
      it '全て揃っている場合' do
        todo.valid?
        expect(todo).to be_valid
      end

      it 'descriptionが空の場合' do
        todo.description = ''
        todo.valid?
        expect(todo).to be_valid
      end
    end

    context '失敗' do
      it 'nameが空の場合' do
        todo.name = ''
        todo.valid?
        expect(todo.errors[:name]).to include("can't be blank")
      end
    end
  end
end
