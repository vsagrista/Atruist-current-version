class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :talents
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  #, :trackable, 
  validates :name, presence: true
  has_many      :sent, 
                :class_name => "Transaction",
                :foreign_key  => "sent_id"

  has_many      :received, 
                :class_name => "Transaction", 
                :foreign_key  => "received_id"
end
