import { useState } from "react";
import "./App.css";
import Banner from "./components/banner/Banner";
import Navbar from "./components/navbar/Navbar";
import Footer from "./components/footer/Footer";
import FeatureCardGrid from "./components/featureCard/featurecard";
import NgoCardGrid from "./components/ngocard/ngocard";

function App() {
  return (
    <div>
      <Navbar />
      <Banner />
      <FeatureCardGrid />
      <NgoCardGrid/>
      <Footer />
    </div>
  );
}

export default App;
