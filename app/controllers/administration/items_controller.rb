# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    def index
      @items = Item.all
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        if @item.discount_percentage != 0
          @item.update(has_discount: true)
          redirect_to administration_items_path, notice: "L'item à bien été modifié"
        end
      else
        redirect_back fallback_location: root_path, alert: "Une erreur est survenue, l'item n'a pas pu être modifié"
      end
    end

    private

    def item_params
      params.require(:item).permit(:discount_percentage)
    end
  end
end
