require 'spec_helper'

describe "Tariff Update listing" do
  let!(:user)   { create :user, :gds_editor }
  let(:tariff_update) { attributes_for(:tariff_update, :chief, :missing) }

  before {
    stub_api_for(TariffUpdate) { |stub|
      stub.get("/updates") { |env|
        api_success_response([tariff_update])
      }
    }
  }

  it "lists all tariff updates" do
    visit tariff_updates_path

    expect(page).to have_content 'CHIEF'
    expect(page).to have_content 'Missing'
  end
end
