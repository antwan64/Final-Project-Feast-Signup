# == Schema Information
#
# Table name: menus
#
#  id                :integer          not null, primary key
#  chicken_pans      :integer
#  dessert_pans      :integer
#  rice_pans         :integer
#  roast_beef_pans   :integer
#  salad_pans        :integer
#  sweet_potato_pans :string
#  vegetable_pans    :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  event_id          :integer
#  user_id           :integer
#
class Menu < ApplicationRecord

  belongs_to :user, counter_cache: :foods_count

  belongs_to :event, counter_cache: true
end
