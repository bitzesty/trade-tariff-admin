class ChemicalName
  include Her::JsonApi::Model

  resource_path "/admin/chemicals/:id/chemical_names"
  collection_path '/admin/chemicals/:id/chemical_names'

  attributes :id, :name

  belongs_to :chemical
end
