import React from "react";
import Clock from "./Clock"
import Tabs from "./Tabs";

const Root = () => (
  <div>
    <Clock />
    <Tabs tabs={[
      {title: "one", content: "I am one"}, 
      {title: "two", content: "I am two"},
      {title: "three", content: "I am three"}
    ]}/>
  </div>
);


export default Root;