import feature1 from "../../assets/Feature1.png";
import feature2 from "../../assets/Feature2.png";
import feature3 from "../../assets/Feature3.png";
import "./featurecard.scss";
function FeatureCardGrid() {
  var featureList = [
    {
      msg: "Donate your food/goods in less than a minute",
      image: feature1,
    },
    {
      msg: "Donate your food/goods in less than a minute",
      image: feature2,
    },
    {
      msg: "Donate your food/goods in less than a minute",
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
    <div className="FeatureCard" >
      <div className="ImageContainer">
        <img src={image} className="Image"  />
      </div>
      <div className="feature-title">{msg}</div>
    </div>
  );
}

// export default FeatureCard;
