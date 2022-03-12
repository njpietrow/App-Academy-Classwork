import React from 'react';
import ReactDOM from 'react-dom';
import { fetchAllPokemon } from './util/api_utl'
import { receiveAllPokemon } from './actions/pokemon_actions'
import configureStore from './store/store' 

document.addEventListener('DOMContentLoaded', () => {
    const rootEl = document.getElementById('root');
    ReactDOM.render(<h1>Pokedex</h1>, rootEl);

    const store = configureStore();

    window.fetchAllPokemon = fetchAllPokemon;
    window.receiveAllPokemon = receiveAllPokemon;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
});