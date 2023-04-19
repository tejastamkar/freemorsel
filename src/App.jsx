import "./App.css";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Home from "./screen/home";
import DonationComponent from "./components/donation/donation";

function App() {
  return (
    <div>
      <BrowserRouter>
        <Routes>
          <Route index path="/" element={<Home />} />
          <Route path="/Donation/wallet/test" element={<DonationComponent />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
