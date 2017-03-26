import React, { Component } from 'react';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import Paper from 'material-ui/Paper';
import Login from './Login';
import './App.css';

const paperStyle = {
  display: 'inline-block',
  textAlign: 'center',
  padding: '0 30px 30px 30px',
};

class App extends Component {
  render() {
    return (
      <MuiThemeProvider>
        <div className="App">
          <div className="App-header">
            <h1>State Manager</h1>
          </div>
          <Paper style={paperStyle} zDepth={1}>
            <Login />
          </Paper>
        </div>
      </MuiThemeProvider>
    );
  }
}

export default App;
