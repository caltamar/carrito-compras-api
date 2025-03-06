module Api
    module V1
        class ProductsController < ApplicationController
            def index
                products = ProductService.all_products  
                render json: products, each_serializer: ProductSerializer
            end

            # Método para devolver X productos
            def limited_list
                quantity = params[:quantity].to_i

                if quantity <= 0
                    return render json: { error: "La cantidad debe ser mayor a 0" }, status: :bad_request
                end

                # 🔥 Obtener el próximo ID disponible
                starting_id = ProductService.next_product_id

                # 🔥 Generar productos dinámicos con IDs únicos
                new_products = (0...quantity).map do |i|
                    Product.new(id: starting_id + i, name: "Producto #{starting_id + i}", price: (starting_id + i) * 100)
                end

                # 🔥 Agregar estos productos a ProductService
                ProductService.add_products(new_products)

                products = ProductService.all_products
                render json: products, each_serializer: ProductSerializer
            end

            # Reiniciar los productos al estado original
            def reset
                ProductService.reset_products
                render json: { message: "Los productos han sido restaurados al estado inicial" }
            end
        end    
    end
end
  