require 'rails_helper'

describe "Measure Type management" do
  let!(:user)   { create :user, :gds_editor }

  describe "Measure Type editing" do
    let(:measure_type)     { build :measure_type }
    let(:new_description)  { "new content" }

    specify do
      stub_api_for(MeasureType) { |stub|
        stub.get("/measure_types") { |env|
          api_success_response([measure_type.attributes])
        }
        stub.get("/measure_types/#{measure_type.id}") { |env|
          api_success_response(measure_type.attributes)
        }
        stub.put("/measure_types/#{measure_type.id}") { |env|
          api_no_content_response
        }
      }

      verify measure_type_created(measure_type)

      update_measure_type_for measure_type, description: new_description

      stub_api_for(MeasureType) { |stub|
        stub.get("/measure_types/#{measure_type.id}") { |env|
          api_success_response(measure_type.attributes.merge(description: new_description))
        }
      }

      verify measure_type_updated(measure_type, description: new_description)
    end
  end

  private

  def update_measure_type_for(measure_type, fields_and_values = {})
    ensure_on edit_measure_type_path(measure_type)

    fields_and_values.each do |field, value|
      fill_in "measure_type_#{field}", with: value
    end

    yield if block_given?

    click_button 'Update Measure type'
  end

  def measure_type_updated(measure_type, args = {})
    ensure_on edit_measure_type_path(measure_type)

    page.has_field?('measure_type_description', with: args[:description])
  end

  def measure_type_created(measure_type)
    ensure_on measure_types_path

    page.has_content? measure_type.id
  end
end
