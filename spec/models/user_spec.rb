require "rails_helper"

describe User do
  let(:user) { FactoryGirl.build(:user) }

  it "gets assigned a uid" do
    user.save!
    expect(user.uid).not_to be_blank
  end

  it "doesn't send a confirmation email" do
    expect{ user.save! }
      .not_to change { ActionMailer::Base.deliveries.count }
  end


  it { expect(user).to respond_to :favorite_recipes }

  ##################################################################
  # #add_recipe_to_favorites
  ##################################################################
  describe "#add_recipe_to_favorites" do
    let(:recipe) { FactoryGirl.create(:recipe) }

    it "adds recipe if not already present" do
      expect{ user.add_recipe_to_favorites(recipe) }
        .to change { user.favorite_recipes.count }.by 1
    end


    it "doesn't add it if already present" do
      user.add_recipe_to_favorites(recipe)

      expect{ user.add_recipe_to_favorites(recipe) }
        .not_to change { user.favorite_recipes.count }
    end

    it "makes a backwards reference from the recipe" do
      expect{ user.add_recipe_to_favorites(recipe) }
        .to change { recipe.fans.count }.by 1
    end

    it "makes a join entry in recipe_users" do
      expect{ user.add_recipe_to_favorites(recipe) }
        .to change { RecipeUser.count }.by 1
    end
  end
end
