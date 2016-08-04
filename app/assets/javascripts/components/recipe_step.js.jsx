var RecipeStep = React.createClass({
  componentWillMount: function() {
    this.setState({
      removed: false
    });
  },

  position: function() {
    var index = this.props.index;
    var name = "recipe[steps_attributes][" + index + "][position]";
    var id = "recipe_steps_attributes_" + index +  "_position";
    return (
      <div className="form-group hidden recipe_steps_position">
      <input className="hidden form-control"
              type="hidden"
              value="0"
              name={ name }
              id={ id }
      />
    </div>
    );
  },

  text: function() {
    var index = this.props.index;
    var name = "recipe[steps_attributes][" + index + "][text]";
    var id = "recipe_steps_attributes_" + index +  "_text";
    return (
      <div className="form-group text optional recipe_steps_text">
        <textarea className="text optional form-control"
                  name={ name }
                  id={ id  }>
        </textarea>
      </div>
    );
  },

  photo: function() {
    var index = this.props.index;
    var id = "recipe_steps_attributes_" + index +  "_photo";
    return (
      <div className="form-group file optional recipe_steps_photo">
        <label className="file optional control-label"
               htmlFor={ id }>
          Photo
        </label>
        <input className="file optional"
               type="file"
               name="recipe[steps_attributes][0][photo]"
        />
      </div>
    );
  },

  removeStep: function(event) {
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
        <div className="recipe_step">
        { this.position() }
        { this.text() }
        { this.photo() }
        <a href='#' onClick={ this.removeStep } >
          Remove
        </a>
        </div>
      );
    }
  }
});

