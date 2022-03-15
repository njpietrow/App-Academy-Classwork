import React from "react";
import { connect } from "react-redux";
import PokemonDetail from "./pokemon_detail";
import {requestSinglePokemon} from "../../actions/pokemon_actions"

const mSTP = (state, ownProps) => {
  // debugger
  return ({
    pokemon: state.entities.pokemon[ownProps.match.params.pokemonId],
    moves: Object.values(state.entities.moves),
    items: Object.values(state.entities.items)
  })
}

const mDTP = (dispatch) => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
})

export default connect(mSTP,mDTP)(PokemonDetail);

//TODO testing.