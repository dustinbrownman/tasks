class List < ActiveRecord::Base
  validates :name, presence: true
  has_many :tasks

  def complete_tasks
  	tasks.where(complete: true)
  end

  def incomplete_tasks
  	tasks.where(complete: false)
  end
end