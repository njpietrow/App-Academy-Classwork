import React from "react";
import Clock from "./Clock"
import Tabs from "./Tabs";

const Root = () => (
  <div>
    <Clock />
    <Tabs tabs={[
      {title: "one", content: "I am one, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has"}, 
      {title: "two", content: "I am two, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has"},
      {title: "three", content: "I am three, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has"}
    ]}/>
  </div>
);


export default Root;