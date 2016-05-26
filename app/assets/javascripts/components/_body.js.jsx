var Body = React.createClass({
  getCurrentUser(){
    $.getJSON('/api/current_user.json', (response) => {
      this.setState({ current_user: response });
      console.log(response);
    }).bind(this);
  },
  render(){
    return <div className="container" >
      <NewSquad/>
      <InviteOwner/>
    </div>
  }
})
