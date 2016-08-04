var RecipePhoto = React.createClass({
  render: function() {
    return (
      <div className="form-group file optional recipe_photo">
        <label className="file optional control-label"
                htmlFor="recipe_photo">
          Photo
        </label>
        <input className="file optional"
                type="file"
                className="recipe[photo]"
                id="recipe_photo"
        />
      </div>
    );
  }
});
