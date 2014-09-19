class Contributor < ActiveRecord::Base
  belongs_to :work
  belongs_to :user

  #validates :contributor, :uniqueness => {:scope => [:work_id, :user_id]}
  validates_uniqueness_of :work_id, scope: :user_id
end