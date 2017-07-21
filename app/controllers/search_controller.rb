class SearchController < ApplicationController
  def index
    search = params[:search]
    @term = search
    agency = params[:agency_type]
    where = {}
    where[:agency_type] = agency unless !agency.present?
    
    if search.present? && agency.present?
        @search = Business.search(search, order: [{business_name: {order: :asc }}],
                                          fields: [:business_name, :city, :state], misspellings: false, 
                                          where: {activated: true, agency_type: where[:agency_type] } )
    else
       @search = Business.search("*", order: [{business_name: {order: :asc }}], 
                                      fields: [:business_name, :city, :state], misspellings: false, where: { agency_type: where[:agency_type], activated: true })
    end
    @total = @search.total_count
    @search = Kaminari.paginate_array(@search).page(params[:page]).per(10)
  end
end
