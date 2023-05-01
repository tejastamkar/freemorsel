import { useEffect, useState } from "react";
import { ethers } from "ethers";
import ErrorMessage from "./ErrorMessage";
import TxList from "./TxList";
import { useLocation } from "react-router-dom";

import "./donation.scss";
import Navbar from "../navbar/Navbar";
import { donationNgoData } from "../../data/data";
import Web3 from "web3";
import { abi } from "../../contract/contract";

export default function DonationComponent() {
  const [error, setError] = useState();
  const [txs, setTxs] = useState([]);
  const [loader, setLoader] = useState(true);
  const [donationData, setdonationData] = useState();

  const location = useLocation();
  const id = new URLSearchParams(location.search).get("id");
  const handleSubmit = async (e) => {
    e.preventDefault();
    const data = new FormData(e.target);
    setError();
    const hash = await startPayment({
      setError,
      setTxs,

      ether: data.get("ether"),
      addr: donationData.addres,
    });
    // await addPerson(id, hash);
  };

  const [web3, setWeb3] = useState(null);
  const [contract, setContract] = useState(null);
  const [people, setPeople] = useState([]);

  useEffect(() => {
    async function loadWeb3() {
      if (window.ethereum) {
        const web3Gen = new Web3(window.ethereum);
        await window.ethereum.enable();
        setWeb3(web3Gen);
      } else if (window.web3) {
        const web3Gen = new Web3(window.web3.currentProvider);
        setWeb3(web3Gen);
      } else {
        console.log("No web3 provider detected");
      }
      await loadContract();
    }
    loadWeb3();
  }, []);

  async function loadContract() {
    if (web3) {
      const networkId = await web3.eth.net.getId();
      const deployedNetwork = "0xA53abDe9eE2EDa7759311e6dC0830293B0B0CdB4";
      const contract = new web3.eth.Contract(abi, deployedNetwork);

      setContract(contract);
    }
  }
  useEffect(() => {
    loadContract();
  }, [web3]);

  useEffect(() => {
    setdonationData(donationNgoData.find((obj) => obj.id == id));
    if (donationData != null) {
      setLoader(false);
    }
  }, [donationData]);

  async function addPerson(id, hash) {
    const time = new Date().toLocaleTimeString();
    const accounts = await web3.eth.getAccounts();
    await contract.methods
      .addPerson(id, time, hash)
      .send({ from: accounts[0] });
  }

  async function getPeople() {
    // const totalPeople = await contract.methods.people().call();
    // const newPeople = [];
    // for (let i = 0; i < totalPeople; i++) {
    // const person = await contract.methods.getPerson(0).call();
    // const person = await contract.methods.getPeople().call();
    await contract.methods.getPeople().call((err, result) => {
      if (err) {
        console.log("Error retrieving people:", err);
      } else {
        console.log("Retrieved people:", result);
        const people = result.map((person) => {
          return {
            id: person[0],
            name: person[1],
            age: person[2],
          };
        });
        console.log("Formatted people list:", people);
      }
    });
    // newPeople.push(person);
    // }
    console.log(person);
    // setPeople(person);
  }
  return loader ? (
    <h2>loading...</h2>
  ) : (
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
      <Navbar />
      <div className="DonationBanner">
        <img src={donationData.image} width="100%" />
      </div>
      <div className="Campaign">
        <div className="camp_details">Campaign Details</div>
        <div className="Information">
          <div className="Info">
            <b>Organization name:</b>
            {donationData.orgName}
          </div>
          <div className="Info">
            <b>Campaign name:</b> {donationData.name}
          </div>
          <div className="Info">
            <b>Description:</b> {donationData.des}
          </div>
        </div>
        <form className="Payment" onSubmit={handleSubmit}>
          <div className="camp_details">Payment Details</div>
          <div className="Information">
            <div className="label">Recipient Address</div>
            <div className="font-bold ml-2">{donationData.addres}</div>
            <div className="label">Amount (in ETH)</div>
            <input
              className="input_amount"
              type="text"
              name="ether"
              required={true}
            />
          </div>
          <div className="donate_div">
            <button className="donate_btn">Donate</button>
          </div>
          <ErrorMessage message={error} />
          <TxList txs={txs} />
        </form>
        {/* <div className="donate_div">
          <button
            className="donate_btn"
            onClick={async () => {
              await getPeople();
            }}
          >
            get recordes
          </button>
          <button
            className="donate_btn"
            onClick={async () => {
              await addPerson(id, "weqe34242342");
            }}
          >
            add recordes
          </button>
          </div> */}
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
    return tx.hash;
  } catch (err) {
    setError(err.message);
  }
};
