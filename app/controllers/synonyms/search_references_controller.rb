module Synonyms
  class SearchReferencesController < ApplicationController
    before_filter :authorize_user

    def index
      @search_references = search_reference_parent.search_references.where(page: page, per_page: per_page)
      @search_references = Kaminari.paginate_array(@search_references, total_count: @search_references.metadata[:pagination][:total])
                                   .page(page)
                                   .per(per_page)
    end

    def new
      @search_reference = SearchReference.new
    end

    def create
      @search_reference = search_reference_parent.search_references.build(search_reference_params)
      @search_reference.referenced_id = search_reference_parent.id

      if @search_reference.valid?
        @search_reference.save

        redirect_to [scope, search_reference_parent, :search_references], notice: 'Search synonym was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      search_reference.assign_attributes(search_reference_params)

      if search_reference.valid?
        search_reference.save

        redirect_to [scope, search_reference_parent, :search_references], notice: 'Search synonym was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      search_reference.destroy

      redirect_to [scope, search_reference_parent, :search_references], notice: 'Search synonym was successfully removed.'
    end

    private

    def search_reference
      @search_reference ||= search_reference_parent.search_references.find(params[:id])
    end
    helper_method :search_reference

    def authorize_user
      authorize SearchReference, :edit?
    end

    def search_reference_params
      params.require(:search_reference).permit(:title)
    end

    def page
      params.fetch(:page, 1)
    end

    def per_page
      params.fetch(:per_page, 25)
    end

    def search_reference_parent
      raise NotImplementedError.new("Please override #search_reference_parent")
    end

    def scope
      raise NotImplementedError.new("Please override #scope")
    end
  end
end
