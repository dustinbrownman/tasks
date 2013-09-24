class Task < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :list
  after_initialize :set_complete

private

  def set_complete
    self.complete ||= false
    true
  end

end