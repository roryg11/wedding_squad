var NewSquad = React.createClass({
  submitSquad(){
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
    return <div className="ui segment">
      <div className="ui form segment">
        <div className="two fields">
          <input ref="name" placeholder="please enter the name of your squad" className="field"></input>
          <input ref="hashtag" placeholder="please enter the hashtag you'll be using for your wedding" className="field"></input>
        </div>
        <button onClick={this.submitSquad}>Save</button>
      </div>
    </div>
  }
})
