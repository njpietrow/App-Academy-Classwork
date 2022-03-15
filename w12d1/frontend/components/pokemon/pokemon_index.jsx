import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from "react-router-dom";

class PokemonIndex extends React.Component{
  constructor(props){
  super(props)
  }
  
  componentDidMount(){
  this.props.requestAllPokemon()
  }
  
  render(){
    

    const {pokemon} = this.props;
    
    const pokemonItems = pokemon.map(poke => (
      <PokemonIndexItem key={poke.id} pokemon={poke} />
    ));
    
    return (
    <section className="pokedex">
      <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
      <ul>
      {pokemonItems}
      </ul>
    </section>
    )
  }
  }
  
  
  
  export default PokemonIndex;