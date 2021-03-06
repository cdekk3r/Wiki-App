class User < ActiveRecord::Base       
  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy
  
  
  before_save { self.email = email.downcase if email.present? }
  after_initialize {self.role ||= :standard }
  
  enum role: [:standard, :premium, :admin]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
