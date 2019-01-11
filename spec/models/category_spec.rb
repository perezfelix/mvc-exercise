# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Model Category instantiation' do
    subject(:new_category) { described_class.new }

    describe 'Category Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:description).of_type(:text).with_options(null: false) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_many(:categorizations).dependent(:destroy) }
      it { is_expected.to have_many(:items).through(:categorizations) }
    end
  end

  describe 'creatable' do
    let(:item) { create(:item) }

    it 'is creatable' do
      expect{ item }.to change(Item, :count).by 1
    end
  end
end
