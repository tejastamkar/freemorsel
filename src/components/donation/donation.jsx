import { useState } from "react";
import { ethers } from "ethers";
import ErrorMessage from "./ErrorMessage";
import TxList from "./TxList";
import { useLocation } from "react-router-dom";
import DonationBanner from "../../assets/DonationBanner.png";
import "./donation.scss";

export default function DonationComponent() {
  const [error, setError] = useState();
  const [txs, setTxs] = useState([]);

  const location = useLocation();
  const addrs = new URLSearchParams(location.search).get("addrs");
  const handleSubmit = async (e) => {
    e.preventDefault();
    const data = new FormData(e.target);
    setError();
    await startPayment({
      setError,
      setTxs,
      ether: data.get("ether"),
      addr: addrs,
    });
  };

  return (
    // <form className="m-4 my-20" onSubmit={handleSubmit}>
    //   <div className="credit-card w-full lg:w-1/2 sm:w-auto shadow-lg mx-auto rounded-xl bg-white">
    //     <main className="mt-4 p-4">
    //       <h1 className="text-xl font-semibold text-gray-700 text-center">
    //         Send ETH payment
    //       </h1>
    //       <div className="my-4">
    //         <div className="my-4">
    //           <input
    //             type="text"
    //             name="addr"
    //             className="input input-bordered block w-full focus:ring focus:outline-none"
    //             placeholder="Recipient Address"
    //           />
    //         </div>
    //         <div className="my-3">
    //           <input
    //             name="ether"
    //             type="text"
    //             className="input input-bordered block w-full focus:ring focus:outline-none"
    //             placeholder="Amount in ETH"
    //           />
    //         </div>
    //       </div>
    //     </main>
    //     <footer className="p-4 bg-green-500 my-3">
    //       <button
    //         type="submit"
    //         className="btn btn-primary submit-button focus:ring focus:outline-none w-full"
    //       >
    //         Donate now
    //       </button>
    //       <ErrorMessage message={error} />
    //       <TxList txs={txs} />
    //     </footer>
    //   </div>
    // </form>
    <div>
      <div className="DonationBanner">
        <img src={DonationBanner} width="100%" />
      </div>
      <div className="Campaign">
        <div className="camp_details">Campaign Details</div>
        <div className="Information">
          <div className="Info">
            <b>Organization name:</b> Samarth Foundation{" "}
          </div>
          <div className="Info">
            <b>Campaign name:</b> Rise against hunger
          </div>
          <div className="Info">
            <b>Description:</b> Thousands of nonprofits and individuals across
            the country work diligently to raise funds and collect supplies in
            the fight against hunger. When disaster strikes, the need for these
            resources is often amplified, yet organizations struggle to match
            the demand and meet the needs of their communities. Specifically,
            that’s what we’ve seen as a result of Covid-19 outbreak. With
            schools closed, millions out of work, and a looming recession ahead,
            families are finding that they don’t know where their next meal will
            come from. To make matters worse, most food banks and pantries are
            being depleted of their resources faster than they can replenish
            them.
          </div>
        </div>
        <div className="Payment">
          <div className="camp_details">Payment Details</div>

          <div className="Information">
            <div className="label">Recipient Address</div>

            <input className="input_address" type="text" />

            <div className="label">Amount (in ETH)</div>
            <input className="input_amount" type="text" />
          </div>
          <div className="donate_div">
            <button className="donate_btn">Donate</button>
          </div>
        </div>
      </div>
    </div>
  );
}

const startPayment = async ({ setError, setTxs, ether, addr }) => {
  try {
    if (!window.ethereum)
      throw new Error("No crypto wallet found. Please install it.");
    // await ethers.
    await window.ethereum.send("eth_requestAccounts");
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    ethers.utils.getAddress(addr);
    const tx = await signer.sendTransaction({
      to: addr,
      value: ethers.utils.parseEther(ether),
    });
    console.log({ ether, addr });
    console.log("tx", tx);
    setTxs([tx]);
  } catch (err) {
    setError(err.message);
  }
};
