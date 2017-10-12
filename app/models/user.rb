class User < ActiveRecord::Base       
  has_many :wikis, dependent: :destroy
  
  before_save { self.email = email.downcase if email.present? }
  after_initialize {self.role ||= :standard }
  
  enum role: [:standard, :premium, :admin]
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, presence: true
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
