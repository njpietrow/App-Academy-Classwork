class Store {
    constructor(rootReducer) {
        this.rootReducer = rootReducer;
        this.state = {};

        this.getState = this.getState.bind(this);
    }

    getState() {
        let fakeState = JSON.parse(JSON.stringify(this.state));
        return fakeState;
    }
}

// export default Store;