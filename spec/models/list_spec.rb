require 'spec_helper'

describe List do 
  it { should validate_presence_of :name }
  it { should have_many :tasks }

  describe '#complete_tasks' do
  	it 'should return all the complete tasks' do
  		list = List.create(name: 'This list')
  		task_a = list.tasks.create(name: 'Walk the fish')
  		task_b = list.tasks.create(name: 'Feed the television', complete: true)
  		list.complete_tasks.should eq [task_b]
  	end
  end

  describe '#incomplete_tasks' do
  	it 'should return all the incomplete tasks' do
  		list = List.create(name: 'This list')
  		task_a = list.tasks.create(name: 'Walk the fish')
  		task_b = list.tasks.create(name: 'Feed the television', complete: true)
  		list.incomplete_tasks.should eq [task_a]
  	end
  end
end