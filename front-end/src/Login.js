import React, { Component } from 'react';
import TextField from 'material-ui/TextField';
import RaisedButton from 'material-ui/RaisedButton';

const buttonStyle = {
  'marginTop': '30px',
};

class Login extends Component {
  constructor() {
    super();
    this.state = {
      email: null,
      password: null
    };
  }

  submit() {
    const headers = new Headers({
      'Content-Type': 'application/json',
    });

    const payload = {
      auth: {
        email: this.state.email,
        password: this.state.password
      }
    };

    fetch('/api/user_token', {
      method: 'POST',
      headers: headers,
      body: JSON.stringify(payload)
    }).then(function(response) {
      return response.json();
    }).then(function (json) {
      localStorage.setItem('jwt', json.jwt);
    });
  }

  render() {
    return (
      <div>
        <TextField
          hintText="Email"
          floatingLabelText="Email"
          onChange={(event, newValue) => this.setState({email: newValue})}
        /><br />
        <TextField
          hintText="Password"
          floatingLabelText="Password"
          type="password"
          onChange={(event, newValue) => this.setState({password: newValue})}
        /><br />
        <RaisedButton
          label="Login"
          primary={true}
          style={buttonStyle}
          onClick={() => this.submit()}
        />
      </div>
    );
  }
}

export default Login;
