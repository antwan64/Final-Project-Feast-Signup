class MenusController < ApplicationController
  def index
    matching_menus = Menu.all

    @list_of_menus = matching_menus.order({ :created_at => :desc })

    render({ :template => "menus/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_menus = Menu.where({ :id => the_id })

    @the_menu = matching_menus.at(0)

    render({ :template => "menus/show" })
  end

  def create
    the_menu = Menu.new
    the_menu.roast_beef_pans = params.fetch("query_roast_beef_pans")
    the_menu.chicken_pans = params.fetch("query_chicken_pans")
    the_menu.salad_pans = params.fetch("query_salad_pans")
    the_menu.vegetable_pans = params.fetch("query_vegetable_pans")
    the_menu.user_id = params.fetch("query_user_id")
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
    the_menu.user_id = params.fetch("query_user_id")
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

  def destroy
    the_id = params.fetch("path_id")
    the_menu = Menu.where({ :id => the_id }).at(0)

    the_menu.destroy

    redirect_to("/menus", { :notice => "Menu deleted successfully."} )
  end
end
