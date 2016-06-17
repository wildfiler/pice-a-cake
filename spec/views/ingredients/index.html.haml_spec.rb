require 'rails_helper'

describe 'ingredients/index.html.haml' do
  context 'check icons' do
    before { allow(view).to receive(:will_paginate) }

    it 'display vegeteian check icon' do
      ingredient = build_stubbed(:ingredient, :vegeterian)
      assign(:ingredients, [ingredient])

      render

      expect(rendered).to have_css("#ingredient-#{ingredient.id} .icon-vegeterian", count: 1)
    end

    it 'display spice check icon' do
      ingredient = build_stubbed(:ingredient, :spice)
      assign(:ingredients, [ingredient])

      render

      expect(rendered).to have_css("#ingredient-#{ingredient.id} .icon-spice", count: 1)
    end

    it "don't display any icons" do
      assign(:ingredients, [build_stubbed(:ingredient)])

      render

      expect(rendered).not_to have_css('.icon-vegeterian')
      expect(rendered).not_to have_css('.icon-spice')
      expect(rendered).not_to have_css('.icon-love')
    end

    context 'user signed_in' do
      it 'display love icon' do
        user = build_stubbed :user
        sign_in_as(user)
        ingredient = build_stubbed(:ingredient)
        allow(ingredient).to receive(:loved_by?).with(user) { true }
        assign(:ingredients, [ingredient])

        render

        expect(rendered).to have_css("#ingredient-#{ingredient.id} .icon-love", count: 1)
      end
    end
  end
end
