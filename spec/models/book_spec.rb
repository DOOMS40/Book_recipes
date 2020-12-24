require 'spec_helper'

describe Book do 
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :genre }
    it { should validate_presence_of :image }
  end
end

