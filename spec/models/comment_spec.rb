require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'creates a valid comment' do
      comment = create(:comment)
      expect(comment).to be_valid
    end
    it 'is invalid without body' do
      no_body_comment = build(:no_body_comment)
      expect(no_body_comment).to_not be_valid
    end
    it 'is invalid without author' do
      no_author_comment = build(:no_author_comment)
      expect(no_author_comment).to_not be_valid
    end
    it 'is invalid without task' do
      no_task_comment = build(:no_task_comment)
      expect(no_task_comment).to_not be_valid
    end
  end
end
