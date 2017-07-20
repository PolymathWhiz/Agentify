class SearchController < ApplicationController
  def index
    search = params[:search]
    @term = search
    agency = params[:agency_type]
    where = {}
    where[:agency_type] = agency unless !agency.present?
    if search.present? && agency.present?
        @search = Business.search(search, fields: [:business_name, :city, :state], misspellings: false, where: { agency_type: where[:agency_type] } )
    else
       @search = Business.search(search, fields: [:business_name, :city, :state], misspellings: false)
    end
    @total = @search.total_count
    @time = @search.took
    @search = Kaminari.paginate_array(@search).page(params[:page]).per(12) # Paginates the results
  end
end
