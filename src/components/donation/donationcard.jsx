import { useParams } from "react-router-dom";
import feature1 from "../../assets/BookDonate.png";
import feature2 from "../../assets/ClothDonate.png";
import feature3 from "../../assets/FoodDonation.png";
import "./donationcard.scss";
export default function NGOsCamps() {
  var campsList = [
    {
      title: "Rise against hunger",
      subtile: "Don't be rude, donate some food.",
      image: feature3,
      waletAddress: '0x0C552365A4cB48cFd14e94daBa297aEC8451ce58',
    },
    {
      title: "Educate a child",
      subtile: "Donate a book, share a story, change a life",
      image: feature1,
    },
    {
      title: "Give your old clothes a new Life",
      subtile: "Items: Clothes in good condition, New clothes are also taken",
      image: feature2,
    },
  ];

  return (
    <div className="MainContainer">
      <div className="MainHeading">NGOs & Campaigns</div>
      <div className="featureGrid">
        {campsList.map((data, index) => (
          <NGOsCampsCard
            title={data.title}
            subtitle={data.subtile}
            image={data.image}
            key={index}
          />
        ))}
      </div>
    </div>
  );
}

function NGOsCampsCard({ title, subtitle, image }) {
  var router = useParams();

  return (
    <div className="donationCards  align-middle content-center m-20  justify-center ">
      <div>
        <img src={image} className="NgoCardImage mx-auto" />
      </div>
      <div className="textContrainer">
        <div className="donation-title mx-auto ">{title}</div>
        <div className="donation-subtitle mx-auto">{subtitle}</div>
      </div>
      <a
        href="/Donation/wallet/test?addrs=0x0C552365A4cB48cFd14e94daBa297aEC8451ce58"
        className="DonationBtn"
      >
        Donation Now !
      </a>
    </div>
  );
}
