import React from "react";
import BannerImg from "../../assets/BannerImg.png";
import Playstore from "../../assets/GooglePlay.png";
import Appstore from "../../assets/AppStore.png";
import Person1 from "../../assets/person1.png";
import Person2 from "../../assets/person2.png";
import "./Banner.scss";
export default function Banner() {
  return (
    <>
      <div className="Banner">
        <img src={BannerImg} width="100%" className="BannerImg" />
        {/* <button className="Btn">Donate Now!</button> */}
      </div>

      <div className="FreeMorsal" id="Vision">
        <div className="content-div">
          <h1 className="title">What is FreeMorsel ?</h1>
          <div className="detail">
            In the form of this initiative called "FreeMorsel," we have chosen a
            pathway to implement our innovative ideas. The essential objective
            that emerged from our effort is to supply essentials to those in
            need.
          </div>
          <div className="detail">
            'FreeMorsel' is a cross-platform application that facilitates the
            donation of helpful products (food, clothing, etc.) to the nearest
            Charity.
          </div>
          {/* <div className="buttons-div">
            <a>
              <img src={Playstore} />
            </a>
            <a>
              <img src={Appstore} />
            </a>
          </div> */}
          <div className="sub-heading">Our Vision</div>
          <div className="info-div">
            Connect people looking for a way to donate without wasting excess
            food.
          </div>
          <div className="sub-heading">Our Mission</div>
          <div className="info-div">
            Analyze and reduce the food wastage from restaurants and hotels.
          </div>
        </div>
      </div>
      {/* <div className="Feedback">
        <h1 className="feedback-title">Donors Feedback</h1>
        <div className="feedback-1">
          <div className="feedback-div">
            <div>
              <img src={Person1} />
            </div>
            <div className="feed">
              “FreeMorsel is on a mission to feed the people who need. It was a
              great experience overall. My best whishes to the team “
            </div>
            <div className="feed">- Akshay Chavan</div>
          </div>
        </div>
      </div> */}
    </>
  );
}
