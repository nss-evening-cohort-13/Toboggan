import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';

class SearchBar extends Component {
  state = {
    searchInput: '',
  }

   handleSubmit = (e) => {
     e.preventDefault();
     this.props.history.push(`/search/${this.state.searchInput}`);

     this.setState({
       searchInput: '',
     });
   }

   handleChange = (e) => {
     this.setState({
       [e.target.name]: e.target.value,
     });
   }

   render() {
     const { searchInput } = this.state;
     return (
      <form onSubmit={this.handleSubmit} className='searchInput'>
      <input type='text' name='searchInput' className='searchInput' style={{ color: 'black' }} value={searchInput} onChange={this.handleChange} />
    </form>
     );
   }
}

export default withRouter(SearchBar);
