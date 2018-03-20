class Contact < ApplicationRecord
  belongs_to :user
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, uniqueness: true

  def as_json
    {
      id: id,
      first_name: first_name,
      middle_name: middle_name,
      bio: bio,
      last_name: last_name,
      email: email,
      phone_number: phone_number_with_extension,
      updated_at: friendly_updated_at,
      full_name: full_name,
      user_id: user_id
    }
  end

  def friendly_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def phone_number_with_extension
    "+81 #{phone_number}"
  end
end
