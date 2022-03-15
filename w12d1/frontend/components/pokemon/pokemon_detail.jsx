import React from "react";

class PokemonDetail extends React.Component {
  constructor(props){
    super(props);
  }

  componentDidMount(){
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }
  
  render() {
    debugger
    const {pokemon, moves, items} = this.props
    if (pokemon === undefined){
      return null;
    }
    return (
      <div>
        <img src={pokemon.image_url}/>
        <h1>{pokemon.name}</h1>
        <h3>Type: {pokemon.type}</h3>
        <h3>Attack: {pokemon.attack}</h3>
        <h3>Defense: {pokemon.defense}</h3>
        <h3>Moves: {moves.map(move => move.name)}</h3>
        <ul>
          {Object.values(items).map( (item, idx) => {
            return (
              <li key={idx}>
                <img src={item.image_url} />
              </li>
            )
          })}
        </ul>
      </div>
    );
  }

}

export default PokemonDetail;