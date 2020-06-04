class User < ActiveRecord::Base
  has_many :wikis
  has_many :collaborators
  has_many :colaborated_wikis, through: :collaborators, source: :wiki

  enum role: [:standard, :premium, :admin]
  after_initialize { self.role ||= :standard}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
