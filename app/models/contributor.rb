class Contributor < ActiveRecord::Base
  belongs_to :work
  belongs_to :user

  validates_uniqueness_of :work_id, scope: :user_id

  def self.filter_contributed_works(work_id, user_id)
    @contributor = Contributor.where(work_id: work_id)
    @all_except_himself = User.all.where.not(id: user_id)
    @reject = @contributor.map{|x| x.user_id}
    @user = @all_except_himself.reject{|x| @ids.include? x.id}
  end
end