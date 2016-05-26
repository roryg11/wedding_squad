var InviteOwner = React.createClass({
  createCoOwner(){
    var email = this.refs.email.value;
    var sender_id = this.props.currentUser.id
    $.ajax(
      { url: '/api/invites',
      type: 'POST',
      data: { invite: { sender_id: 4, email: email } },
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
