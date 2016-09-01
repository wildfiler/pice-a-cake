var RecipeComponent = React.createClass({
  componentWillMount: function() {
    this.setState({
      removed: false
    });
  },

  ingredient_id: function() {
   var index = this.props.index
   var name = "recipe[components_attributes][" + index + "][id]"
   var id = "recipe_components_attributes_" + index + "_id"
   var value = this.props.component.id
   return (
     <input value = { value }
            type = "hidden"
            name = { name }
            id = { id }
     />
   );
  },

  ingredient_options: function() {
    return (
      this.props.ingredients.map(function(ingredient) {
        return (
          <option key = { ingredient.id }
                  value = { ingredient.id }
          >
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
              defaultValue = { this.props.component.ingredient_id }
      >
        <option value = '' disabeled selected>Choose component...</option>
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
             defaultValue = { this.props.component.quantity }
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
             defaultValue = { this.props.component.units }
      />
    );
  },

  removeComponent: function(event) {
    var state = this.state;
    state.removed = true;
    this.setState(state);
    event.preventDefault();
  },

  destroyField: function() {
   var index = this.props.index
   var name = "recipe[components_attributes][" + index + "][_destroy]"
   var id = "recipe_components_attributes_" + index +  "__destroy"
    return (
      <input type = "hidden"
             value = "true"
             name = { name }
             id = { id }
      />
    );
  },

  render: function() {
    if(this.state.removed === true) {
      return(
        <div>
          { this.destroyField() }
          { this.ingredient_id() }
        </div>
      )
    } else {
      return (
        <div className="component">
          { this.ingredient_id() }
          { this.ingredient_select() }
          { this.quantity_input() }
          { this.units_input() }
          <a href = "#"
             onClick = { this.removeComponent }
             className = "remove_component"
          >
            Remove
          </a>
        </div>
      );
    }
  }
});
