require "rails_helper"

RSpec.describe "Layout footer", :after_first_run, :as_member, :aggregate_failures do
  def footer_for(footer_type)
    ClimateControl.modify FOOT_TYPE: footer_type do
      get "/about"
      Nokogiri::HTML(response.body).at_css("#footer")
    end
  end

  it "renders the default footer when FOOT_TYPE is not set" do
    footer = footer_for(nil)

    expect(response).to have_http_status(:success)
    expect(footer).to be_present
    expect(footer.at_css("a[href='https://manyfold.app']")).to be_present
  end

  it "renders the default footer when FOOT_TYPE is default" do
    footer = footer_for("default")

    expect(response).to have_http_status(:success)
    expect(footer).to be_present
    expect(footer.at_css("a[href='https://manyfold.app']")).to be_present
  end

  it "renders the minimalist footer when FOOT_TYPE is minimalist" do
    footer = footer_for("minimalist")

    expect(response).to have_http_status(:success)
    expect(footer).to be_present
    expect(footer.at_css("nav")).to be_present
    expect(footer.at_css("a[href='https://manyfold.app']")).to be_nil
  end

  it "renders no footer when FOOT_TYPE is none" do
    footer = footer_for("none")

    expect(response).to have_http_status(:success)
    expect(footer).to be_nil
  end

  it "renders the default footer when FOOT_TYPE is unknown" do
    footer = footer_for("compact")

    expect(response).to have_http_status(:success)
    expect(footer).to be_present
    expect(footer.at_css("a[href='https://manyfold.app']")).to be_present
  end
end
