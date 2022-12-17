import logo1 from "./logo1.png";
import bgimage from "./dashboardimage.png";
import { useState, useEffect } from "react";
import { db } from "./firebase-config";
import { collection, getDocs } from "firebase/firestore";

//import Axios from "axios";
// const tableElements = {
//   border: "1px solid black",
//   borderCollapse: "collapse",
//   columnWidth: "500px",
//   paddingTop: "5px",
//   paddingBottom: "5px",
//   paddingLeft: "5px",
//   paddingRight: "5px",
// };

function BloodBankDetails() {

  const [BBloginList, setBBLoginList] = useState([]);

  const ref = collection(db, "bb_hospitals_markers");
  function getDocuments() {
    return getDocs(ref);
  }

  useEffect(() => {
    getDataDocs();
  }, []);

  const getDataDocs = async () => {
    const data = await getDocuments();
    console.log(data.docs);
    setBBLoginList(data.docs.map((doc) => ({ ...doc.data(), id: doc.id })));
  };
  return (
    <div>
      <div className="row">
        {/* column 1 */}
        <div className="column1"
          style={{
            backgroundColor: "#F0A8AE"
          }}>

          <div class='odinMainContainer'>
            {/* <!-- Left Sidebar Area[upper] --> */}
            <div class='odinLeftSidebarContainer'>
              <div className="rowlogo">
                <br />
                <div className="columnlogo1" style={{ backgroundColor: "#F0A8AE" }}>
                  <img style={{ width: "95%", height: "100%" }} src={logo1} />
                </div>
                <div class="columnlogo2" style={{ backgroundColor: "" }}>
                  <h1 style={{ fontSize: "23px", opacity: "80%", margin: "0px" }}>LifeLine</h1>
                  <p style={{ margin: "0px" }}>Save a Life<br />Give Blood</p>


                </div>
              </div>
            </div>

            {/* Left Sidebar Area[Lower] */}
            <div class='odinMainContentContainer'>
            <br /><br /> <hr style={{ padding: "0px", margin: "0px", backgroundColor: "black" }} />
              <div style={{ paddingTop: "70px", paddingLeft: "40px" }}>
              <a style={{color: "black",textDecoration: "none",fontSize: "20px",textDecoration: "none",padding: "10px",opacity: "10px",}} href="/">Profile</a><br /><br /> <br />
  <a  style={{color: "black",textDecoration: "none",fontSize: "20px",textDecoration: "none",padding: "10px",opacity: "10px",}} href="/HospitalLogin/HospitalDashboard/BloodRequest">Blood Requests</a><br /><br /> <br />
                
                <a  style={{
                    color: "black",
                    textDecoration: "none",
                    fontSize: "20px",
                    textDecoration: "none",
                    padding: "10px",
                    opacity: "10px",
                  }}
                  href="/HospitalLogin/HospitalDashboard/LocationTracking"
                >
                 Track Donor
                </a>
                <br /><br />
                <br />
                <a
                  style={{
                    color: "black",
                    textDecoration: "none",
                    fontSize: "20px",
                    textDecoration: "none",
                    padding: "10px",
                    opacity: "10px",
                  }}
                  href="/HospitalLogin/HospitalDashboard/BloodBankDetails"
                >
                Blood bank Details
                </a>
                <br />
                <br /><br />
                
                <a
                  style={{
                    color: "black",
                    textDecoration: "none",
                    fontSize: "20px",
                    textDecoration: "none",
                    padding: "10px",
                    opacity: "10px",
                  }}
                  href="/"
                >
                  Logout
                </a><br /><br /><br /></div>
            </div>
          </div>
        </div>

        {/* column 2 */}
        <div className="column2"
          style={{
            backgroundColor: ""
          }}>
          <div class='odinMainContainer11'>
            {/* <!-- Left Sidebar Area --> */}
            <div class='odinLeftSidebarContainer1'>

              <div class="container">

                <img style={{ opacity: "60%" }} src={bgimage} />
                <div class="text-block">
                  <div class="wrap">
                    <div class="search">
                      <input style={{}} type="text" class="searchTerm" placeholder="Search" />

                    </div>
                  </div>
                </div>
              </div>
            </div>

            {/* <!-- Main Content Area --> */}
            <div class='odinMainContentContainer2'>
            <table style={{marginTop:"80px",marginLeft:"80px",tableLayout:"fixed",width:"900px"}}>
            <tr>
                    <th>Title</th>
                    <th>Email</th>
                    <th>Category</th>
                  </tr>
                  {BBloginList.map((doc, index) => {
                    return (
                      <tr>
                        <td>{doc.title}</td>
                        <td>{doc.email}</td>
                        <td>{doc.snippet}</td>
                      </tr>
                    );
                  })}
            </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default BloodBankDetails;
