require "rails_helper"

RSpec.describe SiteSettings do
  describe ".footer_type" do
    it "defaults to the default footer when FOOT_TYPE is not set" do
      ClimateControl.modify FOOT_TYPE: nil do
        expect(described_class.footer_type).to eq("default")
      end
    end

    it "accepts the default footer type" do
      ClimateControl.modify FOOT_TYPE: "default" do
        expect(described_class.footer_type).to eq("default")
      end
    end

    it "accepts the minimalist footer type" do
      ClimateControl.modify FOOT_TYPE: "minimalist" do
        expect(described_class.footer_type).to eq("minimalist")
      end
    end

    it "accepts the none footer type" do
      ClimateControl.modify FOOT_TYPE: "none" do
        expect(described_class.footer_type).to eq("none")
      end
    end

    it "falls back to the default footer type for unknown values" do
      ClimateControl.modify FOOT_TYPE: "compact" do
        expect(described_class.footer_type).to eq("default")
      end
    end
  end

  describe ".footer_visible?" do
    it "is false when FOOT_TYPE is none" do
      ClimateControl.modify FOOT_TYPE: "none" do
        expect(described_class.footer_visible?).to be false
      end
    end
  end

  context "when detecting ignored files" do
    %w[
      ./test.stl
      /test.stl
      test.stl
      test/test.stl
    ].each do |pathname|
      it "accepts `#{pathname}`" do
        expect(described_class.send(:ignored_file?, pathname)).to be false
      end
    end

    %w[
      .test.stl
      test/.test.stl
      .test/test.stl
      model/@eaDir/test.png/SYNOPHOTO_THUMB_S.png
      model/__MACOSX
    ].each do |pathname|
      it "ignores `#{pathname}`" do
        expect(described_class.send(:ignored_file?, pathname)).to be true
      end
    end
  end
end
