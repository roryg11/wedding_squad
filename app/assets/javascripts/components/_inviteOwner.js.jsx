var InviteOwner = React.createClass({
  createCoOwner(){
    var name = this.refs.name.value;
    var hashtag = this.refs.hashtag.value;
    $.ajax(
      { url: '/api/squads',
      type: 'POST',
      data: { squad: { name: name, hashtag: hashtag } },
      success: (response) => { console.log('it worked!', response); }
    });
  },
  render(){
    return <div>
      THis is the invite your SO thing
    </div>
  }
})
