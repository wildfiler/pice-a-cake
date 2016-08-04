var RecipeDescription = React.createClass({
  render: function() {
    return (
      <div className="form-group text optional recipe_description">
        <label className="text optional control-label"
                htmlFor="recipe_description">
          Description
        </label>
          <textarea className="text optional form-control"
                    name="recipe[description]"
                    id="recipe_description">
        </textarea>
      </div>
    );
  }
});

