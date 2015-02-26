require 'rails_helper'

describe "Rollbacks management" do
  let!(:user)   { create :user, :gds_editor }

  describe "Rollback creation" do
    let(:rollback)      { build :rollback }
    let(:pagination) {
      {
        page: 1,
        per_page: 20,
        total_count: 0
      }
    }

    specify do
      stub_api_for(Rollback) { |stub|
        stub.get("/rollbacks") { |env|
          api_success_response(rollbacks: [], pagination: pagination)
        }
      }

      refute rollback_created(rollback)

      stub_api_for(Rollback) { |stub|
        stub.post("/rollbacks") { |env|
          api_created_response
        }

        stub.get("/rollbacks") { |env|
          api_success_response(
            rollbacks: [rollback.attributes],
            pagination: pagination
          )
        }
      }

      create_rollback(rollback)

      verify rollback_created(rollback)
    end
  end

  private

  def rollback_created(rollback)
    ensure_on rollbacks_path

    page.has_selector?("table.rollbacks") &&
      page.has_content?(rollback.date)
  end

  def create_rollback(rollback)
    ensure_on new_rollback_path

    fill_in "rollback_date", with: rollback.date

    click_button 'Create Rollback'
  end
end
