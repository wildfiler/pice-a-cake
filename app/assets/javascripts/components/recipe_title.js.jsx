var RecipeTitle = React.createClass({
  render: function() {
    return <div className="form-group string required recipe_title">
      <label className="string required control-label"
            htmlFor="recipe_title">
        <abbr title="required">*</abbr> Title
      </label>
      <input className="string required form-control"
            required="required"
            aria-required="true"
            type="text"
            name="recipe[title]"
            id="recipe_title" />
    </div>
  }
});
