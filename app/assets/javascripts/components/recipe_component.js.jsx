var RecipeComponent = React.createClass({
  componentWillMount: function() {
    this.setState({
      removed: false
    });
  },

  ingredient_options: function() {
    return (
      this.props.ingredients.map(function(ingredient) {
        return (
          <option key={ ingredient.id } value={ ingredient.id }>
            { ingredient.name }
          </option>
        );
      })
    );
  },

  ingredient_select: function() {
    var name = "recipe[components_attributes][" + this.props.index + "][ingredient_id]"
    return (
      <select className="ingredient select optional"
              name={ name }
      >
        { this.ingredient_options() }
      </select>
    );
  },

  quantity_input: function() {
    var name = "recipe[components_attributes][" + this.props.index + "][quantity]"
    return (
      <input className="quantity numeric integer optional"
             placeholder="Quantity" type="number"
             step="1"
             name={ name }
      />
    );
  },

  units_input: function() {
    var name = "recipe[components_attributes][" + this.props.index + "][units]"
    return (
      <input className="units string optional"
             placeholder="Units"
             type="text"
             name={ name }
      />
    );
  },

  removeComponent: function(event) {
    var state = this.state;
    state.removed = true;
    this.setState(state);
    event.preventDefault();
  },

  render: function() {
    if(this.state.removed === true) {
      return(
        <div />
      );
    } else {
      return (
        <div className="component">
          { this.ingredient_select() }
          { this.quantity_input() }
          { this.units_input() }
          <a href="#" onClick={ this.removeComponent } >
            Remove
          </a>
        </div>
      );
    }
  }
});
