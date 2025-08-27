require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it 'creates a valid project' do
      project = create(:project)
      expect(project).to be_valid
    end
    it 'creates a valid project without description' do
      project = create(:no_descr_project)
      expect(project).to be_valid
    end
    it 'is invalid without a name' do
      no_name_project = build(:no_name_project)
      expect(no_name_project).to_not be_valid
    end
  end
end