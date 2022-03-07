import React from 'react';
import Tile from './tile'

class Board extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        let rows = this.props.board.grid.map((row, idx) => {
            return(
                <div key={idx} className='row'>
                    {row.map((tile, idx2) => {
                        return (
                            <Tile key={idx2} tile={tile} updateGame={this.props.updateGame}/>
                        )
                    })}
                </div>
            )
        })

        return(
            <div className='board'>
                {rows}
            </div>
        )
    }
}

export default Board;