require 'spec_helper'

describe Task do 
  it { should validate_presence_of :name }
  it { should belong_to :list }

  describe '#complete' do
  	it 'should return if a task is complete' do
  		task = Task.create(name: 'Walk the fish', complete: true)
  		task.complete.should eq true
  	end
  end

  it 'it should start off not complete' do 
    task = Task.create(name: 'Walk the fish')
    task.complete.should eq false
  end
end