class Product
    include ActiveModel::Serializers::JSON 
  
    attr_accessor :id, :name, :price
  
    def initialize(attributes = {})
      attributes.each do |key, value|
        send("#{key}=", value)
      end
    end
  
    def attributes
      { 'id' => nil, 'name' => nil, 'price' => nil }
    end
  end
  