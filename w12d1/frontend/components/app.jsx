import React from 'react';
import { Route } from "react-router-dom";
import PokemonIndexContainer from "./pokemon/pokemon_index_container";
import PokemonDetailContainer from './pokemon/pokemon_detail_container';

const App = () => (
    <div>
        <Route path="/" component={PokemonIndexContainer} />
    </div>

)

export default App;