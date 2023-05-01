export var abi = [
  {
    inputs: [
      {
        internalType: "uint256",
        name: "ngoid",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "time",
        type: "string",
      },
      {
        internalType: "string",
        name: "transferAddress",
        type: "string",
      },
    ],
    name: "addPerson",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [],
    name: "getPeople",
    outputs: [
      {
        components: [
          {
            internalType: "uint256",
            name: "ngoid",
            type: "uint256",
          },
          {
            internalType: "string",
            name: "time",
            type: "string",
          },
          {
            internalType: "string",
            name: "transferAddress",
            type: "string",
          },
        ],
        internalType: "struct PersonContract.Person[]",
        name: "",
        type: "tuple[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "index",
        type: "uint256",
      },
    ],
    name: "getPerson",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "",
        type: "string",
      },
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    name: "people",
    outputs: [
      {
        internalType: "uint256",
        name: "ngoid",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "time",
        type: "string",
      },
      {
        internalType: "string",
        name: "transferAddress",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
];
