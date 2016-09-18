var RecipeComponents = React.createClass({
  componentWillMount: function() {
    var components = this.props.components;
    if (components.length == 0) {
      components.push({})
    }
    this.setState({
      components: components
    });
  },

  addComponent: function(event) {
    var state = this.state;
    state.components.push({});
    this.setState(state)
    event.preventDefault();
  },

  render_components: function() {
    var self = this;
    var i = -1;
    return this.state.components.map(function(e){
      i = i + 1;
      return <RecipeComponent index={ i } key={ i } component={ e } ingredients={ self.props.ingredients } />
    });
  },

  render: function(){
    return(
      <div>
        { this.render_components() }
        <a href='#'
           className = "add_component"
           onClick={this.addComponent}
        >
          Add component
        </a>
      </div>
    );
  }
});

