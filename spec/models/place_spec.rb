# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  data_set_id :integer
#  original_id :integer
#  osm_id      :integer
#  osm_key     :string(255)
#  osm_value   :string(255)
#  name        :string(255)
#  lat         :float
#  lon         :float
#  street      :string(255)
#  housenumber :string(255)
#  postcode    :string(255)
#  city        :string(255)
#  country     :string(255)
#  website     :string(255)
#  phone       :string(255)
#  wheelchair  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Place do

  let :place do
    FactoryGirl.build(:place)
  end

  describe "attributes" do

    it { expect(place).to validate_presence_of :name }

    it "saves attributes" do
      place.save!
      expect(place).to be_valid
    end
  end

  describe "associations" do
    it { expect(place).to belong_to :data_set }
  end

end