var NewSquad = React.createClass({
  render(){
    return <div className="ui segment">
      <div className="ui form segment">
        <div className="two fields">
          <input ref="name" placeholder="please enter the name of your squad" className="field"></input>
          <input ref="hashtag" placeholder="please enter the hashtag you'll be using for your wedding" className="field"></input>
        </div>
        <button>Save</button>
      </div>
    </div>
  }
})
