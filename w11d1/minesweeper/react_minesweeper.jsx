import React from "react"
import reactDom from "react-dom";
import ReactDOM from "react-dom"
import Game from "./components/game"

document.addEventListener("DOMContentLoaded", () => {
  let root = document.getElementById("root");
  reactDom.render(<Game />, root);
})