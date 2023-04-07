import feature1 from "../../assets/Feature1.png";
import feature2 from "../../assets/Feature2.png";
import feature3 from "../../assets/Feature3.png";
import "./featurecard.scss";
function FeatureCardGrid() {
  var featureList = [
    {
      msg: "The user information is also stored in the local storage hence no repetitive fetching is required. This feature is made keeping Green IT in mind.",
      image: feature1,
    },
    {
      msg: "This initiative will assist the restaurants in reducing food waste as well as the expense of scraping all the extra food.",
      image: feature2,
    },
    {
      msg: "Through this application, users may donate and volunteer for any campaigns they want.",
      image: feature3,
    },
  ];

  return (
    <div className="MainContainer" id="Features">
      <div className="MainHeading">Top Features</div>
      <div className="featureGrid">
        {featureList.map((data, index) => (
          <FeatureCard msg={data.msg} image={data.image} key={index} />
        ))}
      </div>
    </div>
  );
}

export default FeatureCardGrid;

function FeatureCard({ msg, image }) {
  return (
    <div className="FeatureCard">
      <div className="ImageContainer">
        <img src={image} className="Image" />
      </div>
      <div className="feature-title">{msg}</div>
    </div>
  );
}

// export default FeatureCard;
