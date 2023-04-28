import Banner from ".././components/banner/Banner";
import Navbar from ".././components/navbar/Navbar";
import Footer from ".././components/footer/Footer";
import FeatureCardGrid from ".././components/featureCard/featurecard";
import NgoCardGrid from ".././components/ngocard/ngocard";
import SocialParadigm from ".././components/socialParadigm/socialParadigm";
import NGOsCamps from "../components/donation/donationcard";
export default function Home() {
  return (
    <div>
      <Navbar />
      <Banner />
      <FeatureCardGrid />
      <NgoCardGrid />
      <NGOsCamps />
      <SocialParadigm />
      <Footer />
    </div>
  );
}
