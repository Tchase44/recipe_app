class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :recipes

  # validate :username :username_format
  # validateds :role
  # Head chef = Admin
  # sous/deputy Chef = Approved User
  # linecook = RandomUser, no views right now

  def role_level
    case self.role.downcase.strip.delete(' ')
    when "headchef"
      1
    when "souschef"
      2
    when "linecook"
      3
    else
      3
    end
  end

  private

  def username_format
    # if contains bad chararters fail
  end
end
