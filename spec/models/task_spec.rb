require 'spec_helper'

describe Task do 
  it { should validate_presence_of :name }
  it { should belong_to :list }

  it 'it should start off not complete' do 
    task = Task.create(name: 'Walk the fish')
    task.complete.should eq false
  end
end