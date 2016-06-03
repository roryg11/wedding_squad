var Body = React.createClass({
  getInitialState(){
      return {currentUser: ""}
  },
  componentDidMount: function () {
    this.state.currentUser = this.getCurrentUser();
  },
  handleCurrentUser(response){
    this.setState({currentUser: response})
  },
  getCurrentUser(){
    $.getJSON('/api/current_user.json', this.handleCurrentUser);
  },
  render(){
    return <div className="container" >
      <NewSquad currentUser={this.state.currentUser}/>
      <InviteOwner currentUser={this.state.currentUser}/>
    </div>
  }
})
