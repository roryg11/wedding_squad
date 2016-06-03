var InviteOwner = React.createClass({
  getInitialState(){
    return {
      currentUser: ""
    }
  },
  componentDidMount(){
    this.state.currentSquad = this.getCurrentSquad();
  },
  handleCurrentSquad(response){
    this.setState({currentSquad: response})
  },
  getCurrentSquad(){
    $.getJSON('api/my_squads.json', this.handleCurrentSquad);
  },
  createCoOwner(){
    var email = this.refs.email.value;
    var sender_id = this.props.currentUser.id;
    var squad = this.state.currentSquad.id;
    $.ajax(
      { url: '/api/invites',
      type: 'POST',
      data: { invite: { sender_id: sender_id, email: email, squad_id: squad } },
      success: (response) => { console.log('it worked!', response); }
    });
  },
  render(){
    return <div className="ui form segment">
      <div className="two fields">
        <h3>Invite Your Co-Owner</h3>
        <input ref="email" placeholder="please enter the email of your co-owner" className="field"></input>
      </div>
      <button onClick={this.createCoOwner}>Save</button>
    </div>
  }
})
