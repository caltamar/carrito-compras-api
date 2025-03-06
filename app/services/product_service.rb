class ProductService
    @@default_products  = [
        Product.new(id: 1, name: "Producto 1", price: 100),
        Product.new(id: 2, name: "Producto 2", price: 200),
        Product.new(id: 3, name: "Producto 3", price: 300),
        Product.new(id: 4, name: "Producto 4", price: 400),
        Product.new(id: 5, name: "Producto 5", price: 500)
    ]

    @@products = @@default_products.dup

    # Obtener todos los productos
    def self.all_products
        @@products
    end

    # Permitir agregar productos dinámicamente
    def self.add_products(new_products)
        # Evita agregar productos duplicados
        new_products.each do |product|
            unless @@products.any? { |p| p.id == product.id }
                @@products << product
            end
        end
    end

    # Obtener el ID más alto actual
    def self.next_product_id
        @@products.map(&:id).max.to_i + 1
    end

    # Reiniciar los productos a su estado original
    def self.reset_products
        @@products = @@default_products.dup
    end
end