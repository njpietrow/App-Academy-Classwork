import React from 'react';

class Tile extends React.Component {
    constructor(props) {
        super(props);
    }

    handleClick(e) {
        // e.preventDefault();
        let revealing = true;
        if (e.altKey) {
            revealing = false;
        };
        this.props.updateGame(this.props.tile, revealing)
    }

    render() {

        let display;
        let displayClass = "";
        if (this.props.tile.explored) {
            displayClass = "revealed";
            if (this.props.tile.bombed) {
                display = "💣";
            }
            else {
                display = this.props.tile.adjacentBombCount() || " ";
            }
        }
        else if (this.props.tile.flagged) {
            displayClass = "flagged"
            display = "🚩";
        }
        else {
            display = "";
        }

        return (
            <div className={'tile ' + displayClass} onClick={(e) => this.handleClick(e)}>
                {display}
            </div>
        )
    }
}

export default Tile;