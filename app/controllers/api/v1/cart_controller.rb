module Api
    module V1
      class CartController < ApplicationController
        @@cart = []
  
        # Devuelve los productos en el carrito
        def index
          render json: { cart: @@cart }
        end
  
        # Agrega un producto al carrito según su ID
        def add
            product_id = params[:id].to_i
            product = ProductService.all_products.find { |p| p.id == product_id }
    
            if product
                @@cart << product
                render json: { message: "Producto agregado al carrito", cart: @@cart }
            else
                render json: { error: "Producto no encontrado" }, status: :not_found
            end
        end

        # Vaciar el carrito
        def clear
            @@cart.clear
            render json: { message: "El carrito ha sido vaciado", cart: @@cart }
        end

      end
    end
end