class MenusController < ApplicationController
  before_action :authenticate_user!, only: [:sign_up_for_menu_item]

  def index
    matching_menus = Menu.all

    @list_of_menus = matching_menus.order({ :created_at => :desc })
   

    render({ :template => "menus/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_menus = Menu.where({ :id => the_id })

    @the_menu = matching_menus.at(0)


    matching_events = Event.where({ :id => @the_menu.event_id })
    @event = matching_events.at(0)
    



    render({ :template => "menus/show" })
  end

  def create
    the_menu = Menu.new
    the_menu.roast_beef_pans = params.fetch("query_roast_beef_pans")
    the_menu.chicken_pans = params.fetch("query_chicken_pans")
    the_menu.salad_pans = params.fetch("query_salad_pans")
    the_menu.vegetable_pans = params.fetch("query_vegetable_pans")
    the_menu.user_id = current_user.id
    the_menu.event_id = params.fetch("query_event_id")
    the_menu.rice_pans = params.fetch("query_rice_pans")
    the_menu.sweet_potato_pans = params.fetch("query_sweet_potato_pans")
    the_menu.dessert_pans = params.fetch("query_dessert_pans")

    if the_menu.valid?
      the_menu.save
      redirect_to("/menus", { :notice => "Menu created successfully." })
    else
      redirect_to("/menus", { :alert => the_menu.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_menu = Menu.where({ :id => the_id }).at(0)

    the_menu.roast_beef_pans = params.fetch("query_roast_beef_pans")
    the_menu.chicken_pans = params.fetch("query_chicken_pans")
    the_menu.salad_pans = params.fetch("query_salad_pans")
    the_menu.vegetable_pans = params.fetch("query_vegetable_pans")
    the_menu.user_id = current_user.id
    the_menu.event_id = params.fetch("query_event_id")
    the_menu.rice_pans = params.fetch("query_rice_pans")
    the_menu.sweet_potato_pans = params.fetch("query_sweet_potato_pans")
    the_menu.dessert_pans = params.fetch("query_dessert_pans")

    if the_menu.valid?
      the_menu.save
      redirect_to("/menus/#{the_menu.id}", { :notice => "Menu updated successfully."} )
    else
      redirect_to("/menus/#{the_menu.id}", { :alert => the_menu.errors.full_messages.to_sentence })
    end
  end

  def sign_up_for_menu_item
    the_menu = Menu.where({ :id => params.fetch("menu_id") }).at(0)
    messages = []


    roast_beef_pans_quantity = params.fetch("roast_beef_pans_quantity").to_i
    if roast_beef_pans_quantity > 0
      if the_menu.sign_up_for_roast_beef_pans(roast_beef_pans_quantity)
        messages << "You have successfully signed up for #{roast_beef_pans_quantity} roast beef pans."
      else
        messages << "There are not enough roast beef pans available to fulfill your request."
      end
    end

    chicken_pans_quantity = params.fetch("chicken_pans_quantity").to_i
    if chicken_pans_quantity > 0
      if the_menu.sign_up_for_chicken_pans(chicken_pans_quantity)
        messages << "You have successfully signed up for #{chicken_pans_quantity} chicken pans."
      else
        messages << "There are not enough chicken pans available to fulfill your request."
      end
    end

  vegetable_pans_quantity = params.fetch("vegetable_pans_quantity").to_i
    if vegetable_pans_quantity > 0
      if the_menu.sign_up_for_vegetable_pans(vegetable_pans_quantity)
        messages << "You have successfully signed up for #{vegetable_pans_quantity} vegetable pans."
      else
        messages << "There are not enough vegetable pans available to fulfill your request."
      end
    end

    dessert_pans_quantity = params.fetch("dessert_pans_quantity").to_i
      if dessert_pans_quantity > 0
        if the_menu.sign_up_for_dessert_pans(dessert_pans_quantity)
          messages << "You have successfully signed up for #{dessert_pans_quantity} dessert pans."
        else
          messages << "There are not enough dessert pans available to fulfill your request."
        end
      end
    
    rice_pans_quantity = params.fetch("rice_pans_quantity").to_i
      if rice_pans_quantity > 0
        if the_menu.sign_up_for_rice_pans(rice_pans_quantity)
          messages << "You have successfully signed up for #{rice_pans_quantity} rice pans."
        else
        messages << "There are not enough rice pans available to fulfill your request."
        end
      end

    sweet_potato_pans_quantity = params.fetch("rice_pans_quantity").to_i
      if sweet_potato_pans_quantity > 0
        if the_menu.sign_up_for_sweet_potato_pans(sweet_potato_pans_quantity)
          messages << "You have successfully signed up for #{sweet_potato_pans_quantity} sweet_potato pans."
        else
        messages << "There are not enough sweet_potato pans available to fulfill your request."
        end
      end

    salad_pans_quantity = params.fetch("salad_pans_quantity").to_i
      if salad_pans_quantity > 0
        if the_menu.sign_up_for_salad_pans(salad_pans_quantity)
          messages << "You have successfully signed up for #{salad_pans_quantity} salad pans."
        else
        messages << "There are not enough salad pans available to fulfill your request."
        end
      end
    
    if messages.any?
      redirect_to("/menus/#{the_menu.id}", { :notice => messages.join(", ") })
    else
      redirect_to("/menus/#{the_menu.id}", { :alert => "No items were selected for sign-up." })
    end   
  end

  def destroy
    the_id = params.fetch("path_id")
    the_menu = Menu.where({ :id => the_id }).at(0)

    the_menu.destroy

    redirect_to("/menus", { :notice => "Menu deleted successfully."} )
  end
end
