import feature1 from "../../assets/BookDonate.png";
import feature2 from "../../assets/ClothDonate.png";
import feature3 from "../../assets/FoodDonation.png";
import "./ngocard.scss";
function NgoCardGrid() {
  var NgoList = [
    {
      title: "Food Donation drive at Thane",
      subtitle: "Items: Cooked meal, Vegetables, Tetra packs, Oils etc",
      image: feature1,
    },
    {
      title: "Donate your books for orphans",
      subtitle: "Items: Books, uniforms and other Stationary items",
      image: feature2,
    },
    {
      title: "Donate Clothes for old age home",
      subtitle: "Items: Clothes in good condition, New clothes are also taken",
      image: feature3,
    },
  ];

  return (
    <div className="MainContainer">
      <div className="MainHeading">NGOs & Campaigns</div>
      <div className="featureGrid">
        {NgoList.map((data, index) => (
          <NgoCard
            title={data.title}
            subtitle={data.subtitle}
            image={data.image}
            key={index}
          />
        ))}
      </div>
    </div>
  );
}

export default NgoCardGrid;

function NgoCard({ title, subtitle, image }) {
  return (
    <div className="NgoCard">
      <div className="NGOImageContainer">
        <img src={image} className="NGOImage" />
      </div>
      <div className="NGO-title">{title}</div>
      <div className="NGO-subtitle">{subtitle}</div>
    </div>
  );
}

// export default FeatureCard;
