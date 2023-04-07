import React from "react";
import Logo from "../../assets/Logo.png";
import "./Navbar.scss";
export default function Navbar() {
  return (
    <div className="navigationBar">
      <div className="logo_Div">
        <img className="logo" src={Logo} />
      </div>
      <div className="nav_links">
        <ul className="menu">
          <li className="li">
            <a className="a" href="/">
              Home
            </a>
          </li>
          <li className="li">
            <a href="#Vision" className="a">
              Our Vision
            </a>
          </li>
          <li className="li">
            <a className="a" href="#Features">
              Feature
            </a>
          </li>
          <li className="li">
            <a className="a" href="#ContactUs">
              Contact us
            </a>
          </li>
        </ul>
      </div>
    </div>
  );
}