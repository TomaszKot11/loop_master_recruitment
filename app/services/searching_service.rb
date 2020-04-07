class SearchingService < ApplicationService
    def call
        operate
    end

    private 

    def operate
        model_query_name_arr = @service_params.fetch(:query, nil)&.split(':')
        return [] if model_query_name_arr&.count != 2
    
        model_name = model_query_name_arr.first.capitalize
        name = model_query_name_arr.second.capitalize

        if  model_name == 'Product'
           return Product.where(title: name)
        elsif ['Genre', 'Label'].include? model_name
            # I assume both Label and Genre have name column
            return model_name.constantize.where(name: name).includes(:products).map { |el| el.products }.flatten
        end
        []
    end
end