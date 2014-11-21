require 'rails_helper'

describe HealthcheckController do
  it "returns success on request" do
    # Section.stub(:all).and_return([])

    get :check
    expect(response.status).to eq(200)
  end
end
