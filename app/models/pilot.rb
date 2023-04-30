class Pilot < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum profile: {
    pilot: 0,
    admin: 1,
    staff: 2,
  }
  enum rank: {
    student: 0,
    first_officer: 1,
    captain: 2,
    senior_captain: 3,
  }
  enum status: {
    active: 0,
    inactive: 1,
    suspended: 2,
  }
end
