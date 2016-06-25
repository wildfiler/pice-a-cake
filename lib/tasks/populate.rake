require 'factory_girl_rails'
require 'faker'

namespace :data do
  namespace :populate do
    desc 'create ingredients of all types'
    task :ingredients, [:option] => :environment do |_t, option|
      if Rails.env.production?
        puts "You can't run this command in #{Rails.env} environment"
        exit
      end

      Ingredient.delete_all if option[:option] == 'delete'
      40.times do
        vegetarian_chance = (1 + rand(3)) == 1
        options = [:ingredient]
        options << :vegeterian if vegetarian_chance
        FactoryGirl.create(*options, name: name_of_ingredient)
      end

      10.times do
        vegetarian_chance = (1 + rand(3)) == 1
        options = [:ingredient, :spice]
        options << :vegeterian if vegetarian_chance
        FactoryGirl.create(*options, name: name_of_ingredient)
      end
    end

    desc 'create recipe 20 recipes with 1-5 components'
    task :recipes, [:option] => :environment do |_t, option|
      if Rails.env.production?
        puts "You can't run this command in #{Rails.env} environment"
        exit
      end

      [Recipe, Component].each(&:delete_all) if option[:option] == 'delete'

      number_of_ingredients = Ingredient.count
      20.times do
        recipe = FactoryGirl.create :recipe
        number_of_components = rand(5) + 1

        number_of_components.times do
          ingredient = Ingredient.offset(rand(number_of_ingredients)).first
          quantity = rand(20) + 1
          units_types = %w(kg, l, g, glass, spoon)
          units = units_types.sample
          FactoryGirl.create :component,
                             recipe_id: recipe.id,
                             ingredient_id: ingredient.id,
                             units: units,
                             quantity: quantity
        end

        next unless recipe.ingredients.to_a.all?(&:spice?)
        ingredient = Ingredient.where(spice: false).offset(rand(Ingredient.count)).first
        quantity = rand(20) + 1
        FactoryGirl.create :component,
                           recipe_id: recipe.id,
                           ingredient_id: ingredient.id,
                           quantity: quantity
      end
    end
  end
end

def name_of_ingredient
  "#{Faker::StarWars.specie} #{Faker::Beer.hop} from #{Faker::StarWars.planet}"
end
