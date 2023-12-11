# == Schema Information
#
# Table name: user_menu_items
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  menu_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_user_menu_items_on_menu_id  (menu_id)
#  index_user_menu_items_on_user_id  (user_id)
#
# Foreign Keys
#
#  menu_id  (menu_id => menus.id)
#  user_id  (user_id => users.id)
#
class UserMenuItem < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :menu

  # Validations
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Custom logic to ensure that the quantity doesn't exceed the available amount could also go here
end

