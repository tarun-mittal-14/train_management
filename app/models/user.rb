class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 'admin', passenger: 'passenger' }

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :passenger
  end
end
