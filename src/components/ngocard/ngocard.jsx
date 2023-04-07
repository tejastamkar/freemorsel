import feature1 from "../../assets/BookDonate.png";
import feature2 from "../../assets/ClothDonate.png";
import feature3 from "../../assets/FoodDonation.png";
import "./ngocard.scss";
function NgoCardGrid() {
  var NgoList = [
    {
      title: "Food Donation",
      // subtitle: "Items: Cooked meal, Vegetables, Tetra packs, Oils etc",
      image: feature3,
    },
    {
      title: "Good Donation",
      // subtitle: "Items: Books, uniforms and other Stationary items",
      image: feature1,
    },
    {
      title: "Clothes Donation",
      // subtitle: "Items: Clothes in good condition, New clothes are also taken",
      image: feature2,
    },
  ];

  return (
    <div className="MainContainer">
      <div className="MainHeading">NGOs & Campaigns</div>
      <div className="featureGrid">
        {NgoList.map((data, index) => (
          <NgoCard title={data.title} image={data.image} key={index} />
        ))}
      </div>
    </div>
  );
}

export default NgoCardGrid;

function NgoCard({ title, image }) {
  return (
    <div className="NgoCard">
      <div className="NGOImageContainer">
        <img src={image} className="NGOImage" />
      </div>
      <div className="NGO-title">{title}</div>
      {/* <div className="NGO-subtitle">{subtitle}</div> */}
    </div>
  );
}

// export default FeatureCard;
