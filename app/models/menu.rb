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

  has_many :user_menu_items
  has_many :users, through: :user_menu_items


  def sign_up_for_roast_beef_pans(quantity)
    if self.roast_beef_pans >= quantity
      self.roast_beef_pans -= quantity
      return self.save
    else
      # Not enough chicken pans left
      return false
    end
  end

  def sign_up_for_chicken_pans(quantity)
    if self.chicken_pans >= quantity
      self.chicken_pans -= quantity
      return self.save
    else
      # Not enough chicken pans left
      return false
    end
  end

  def sign_up_for_salad_pans(quantity)
    if self.salad_pans >= quantity
      self.salad_pans -= quantity
      return self.save
    else
      # Not enough chicken pans left
      return false
    end
  end


  def sign_up_for_vegetable_pans(quantity)
    if self.vegetable_pans >= quantity
      self.vegetable_pans -= quantity
      return self.save
      # Not enough chicken pans left
      return false
    end
  end
  def sign_up_for_rice_pans(quantity)
    if self.rice_pans >= quantity
      self.rice_pans -= quantity
      return self.save
    else
      # Not enough chicken pans left
      return false
    end
  end

  def sign_up_for_sweet_potato_pans(quantity)
    if self.sweet_potato_pans >= quantity
      self.sweet_potato_pans -= quantity
      return self.save
    else
      # Not enough chicken pans left
      return false
    end
  end
  def sign_up_for_dessert_pans(quantity)
    if self.dessert_pans >= quantity
      self.dessert_pans -= quantity
      return self.save
    else
      # Not enough chicken pans left
      return false
    end
  end
  
  


end
