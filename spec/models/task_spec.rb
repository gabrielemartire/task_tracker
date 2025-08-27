require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it 'is valid with only required fields' do
      task = create(:task)
      expect(task).to be_valid
    end

    it 'is invalid without name' do
      task = build(:no_title_task)
      expect(task).to_not be_valid
    end

    it 'is invalid without project' do
      task = build(:no_project_task)
      expect(task).to_not be_valid
    end
  end
end
