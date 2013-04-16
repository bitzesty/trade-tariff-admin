require 'spec_helper'

describe HealthcheckController do
  it "returns success on request" do
    # Section.stub(:all).and_return([])

    get :check
    response.status.should == 200
  end
end
