# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_secure_password
    before_save {email.downcase!}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, :password, :email, presence: true
    validates :name,        length: {maximum: 50}
    validates :password,    length: {minimum: 6}
    validates :email,       length: {maximum: 255},
                            format: {with: VALID_EMAIL_REGEX},
                            uniqueness: true
end
