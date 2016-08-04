var RecipeSteps = React.createClass({
  componentWillMount: function() {
    var steps = this.props.steps;
    this.setState({
      steps: steps
    });
  },

  addStep: function(event) {
    var state = this.state;
    state.steps.push([]);
    this.setState(state);
    event.preventDefault();
  },

  render_steps: function() {
    var i = -1;
    return this.state.steps.map(function(step) {
      i = i + 1;
      return <RecipeStep index={ i } key={ i } step= { step } />
    });
  },

  render: function() {
    return (
      <div>
        { this.render_steps() }
        <a href='#'
           onClick={ this.addStep }
           className="add_step"
        >
          Add step
        </a>
      </div>
    );
  }
});
