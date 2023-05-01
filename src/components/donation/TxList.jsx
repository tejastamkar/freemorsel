export default function TxList({ txs }) {
  if (txs.length === 0) return null;

  return (
    <>
      {txs.map((item) => (
        <div key={item} className="alert alert-info mx-auto">
          <div className="align-middle justify-center text-center">
            <label>
              <span className="text-green-800">Hash:</span> {item.hash}
            </label>
          </div>
        </div>
      ))}
    </>
  );
}
