var InviteOwner = React.createClass({
  createCoOwner(){
    var name = this.refs.name.value;
    var hashtag = this.refs.hashtag.value;
    $.ajax(
      { url: '/api/invites',
      type: 'POST',
      data: { invite: { sender_id: name, email: hashtag } },
      success: (response) => { console.log('it worked!', response); }
    });
  },
  render(){
    return <div>
      <input>
      <inpu>
    </div>
  }
})
