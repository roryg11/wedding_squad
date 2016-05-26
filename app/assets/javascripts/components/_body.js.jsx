var Body = React.createClass({
  getInitialState(){
      return {currentUser: ""}
  },
  componentDidMount: function () {
    this.state.data = this.getCurrentUser();
  },
  getCurrentUser(){
    $.getJSON('/api/current_user.json', (response) => {
      this.setState({ currentUser: response });
    }).bind(this);
  },
  render(){
    return <div className="container" >
      <NewSquad currentUser={this.state.currentUser}/>
      <InviteOwner currentUser={this.state.currentUser}/>
    </div>
  }
})
