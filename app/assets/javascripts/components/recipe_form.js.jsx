var RecipeForm = React.createClass({
  render: function(){
    return(
      <form method="POST" action={ this.props.url }>
        <input type="hidden"
               name="authenticity_token"
               value={ this.props.authenticity_token }
        />
        <h1>New Recipe</h1>
        < RecipeTitle />
        < RecipeDescription />
        <h3> Components </h3>
        < RecipeComponents components={ this.props.components }
                           ingredients={ this.props.ingredients } />
        <h3> Steps </h3>
        < RecipeSteps steps={ this.props.steps  }/>
        <input type="submit"
               className="commit"
               value="Create Recipe"
        />
      </form>
    )
  }
});

