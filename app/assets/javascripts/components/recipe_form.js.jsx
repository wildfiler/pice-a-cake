var RecipeForm = React.createClass({
  render: function(){
    var form_title = "New recipe";
    var button_name = "Create Recipe";
    var method = "POST";
    if (this.props.recipe.id !== null) {
      form_title = "Edit recipe";
      button_name = "Save Recipe";
      method = "PATCH";
    }

    return(
      <form method="POST" action={ this.props.url }>
        <input type="hidden"
               name="_method"
               value= {  method }
        />
        <input type = "hidden"
               name="authenticity_token"
               value={ this.props.authenticity_token }
        />
        <h1>New Recipe</h1>
        < RecipeTitle title = { this.props.recipe.title  }/>
        < RecipeDescription description = { this.props.recipe.description }/>
        < RecipePhoto photo = { this.props.recipe.photo } />
        <h3> Components </h3>
        < RecipeComponents components={ this.props.components }
                           ingredients={ this.props.ingredients } />
        <h3> Steps </h3>
        < RecipeSteps steps={ this.props.steps  }/>
        <input type="submit"
               className="commit"
               value = { button_name }
        />
      </form>
    )
  }
});

