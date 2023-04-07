import mapImage from "../../assets/map.png";
import hotelImage from "../../assets/hotel.png";
import "./socialparadigm.scss";
function SocialParadigm() {
  var socialList = [
    {
      title:
        "Our R&D team keeps monitoring local areas to discover slum areas where there is requirement of food and goods on a larger scale.Our rider will distribute the food gathered from users and hotel chains to those in need in these locations.",
      image: mapImage,
    },
    {
      title:
        "We analyse food scraping information obtained from various hotels and restaurants and determine food waste percentages for them, which we then send to them. They may utilise these statistics to reduce their food waste.",
      image: hotelImage,
    },
  ];

  return (
    <div className="MainContainer">
      <div className="MainHeading">SocialParadigm</div>
      <div className="featureGrid">
        {socialList.map((data, index) => (
          <SocialParadigmCard
            title={data.title}
            image={data.image}
            key={index}
          />
        ))}
      </div>
    </div>
  );
}

export default SocialParadigm;

function SocialParadigmCard({ title, image }) {
  return (
    <div className="scoialCard">
      <div className="SocialCardImageCon">
        <img src={image} className="SocialImage" />
      </div>
      <div className="Social-title">{title}</div>
    </div>
  );
}
