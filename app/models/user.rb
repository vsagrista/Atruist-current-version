class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :talents
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  #, :trackable, 
  after_create :send_admin_mail
  validates :name, presence: true
  has_many      :sent, 
                :class_name => "Transaction",
                :foreign_key  => "sent_id"

  has_many      :received, 
                :class_name => "Transaction", 
                :foreign_key  => "received_id"
  def send_admin_mail
     UserMailer.welcome_email(self).deliver_now
  end

  def self.get_user_from_talent_id(talent_id)
    User.find(Talent.find(talent_id).user_id).id
  end
 
end
