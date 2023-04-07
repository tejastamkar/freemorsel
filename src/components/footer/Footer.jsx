import React from "react";
import "./Footer.scss";
import Logo from "../../assets/Logo.png";
import Instagram from "../../assets/instagram.png";
import Facebook from "../../assets/facebook.png";
import Twitter from "../../assets/twitter.png";
import PlayStore from "../../assets/playstoreBtn.png";
import AppStore from "../../assets/appstorebtn.png";
export default function Footer() {
  return (
    <div className="Footer" id="ContactUs">
      <div className="Footer_Sec_1">
        <div className="logoSec">
          <img src={Logo} className="footer_logo" />
        </div>
        <div className="ContectSec">
          <div className="col_title">Contact Us</div>
          <div className="col2_details">Email: tech@petaraa.com </div>
          <div className="col2_details">Phone No: 77770 83939</div>
        </div>
        <div className="SocialSec">
          <div className="col_title">Social Accounts</div>
          <div className="col3_icons">
            <img src={Twitter} alt="Twitter" />
            <img src={Instagram} alt="Instagram" />
            <img src={Facebook} alt="Facebook" />
          </div>
        </div>
        {/* <div className="col_4">
          <div className="col4Btn">
            <a href="/" className="linkBtn">
              <img src={PlayStore} alt="Play Store" />
            </a>
          </div>
          <div className="col4Btn">
            <a href="/" className="linkBtn">
              <img src={AppStore} alt="App Store" />
            </a>
          </div>
        </div> */}
      </div>

      <div className="Footer_Sec_2">
        <div className="policy">
          <a>Privacy Policy</a>
        </div>
        <div className="policy">
          <a>Terms of Use</a>
        </div>
        <div className="policy">
          <a>Cookie Policy</a>
        </div>
      </div>
    </div>
  );
}
