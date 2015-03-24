require 'rails_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should belong_to :list }

  describe '.not_done' do
    it 'returns only tasks that are not done' do
      this_list = List.create({ :name => 'homework', :id => 1 })
      done_task = Task.create({ :description => 'stuff', :done => true, :list_id => 1 })
      not_done_task = Task.create({ :description => 'fluff', :done => false, :list_id => 1 })

      expect(this_list.tasks.not_done).to eq([not_done_task])
    end
  end

end
