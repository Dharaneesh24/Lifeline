import logo1 from "./logo1.png";
import bgimage from "./dashboardimage.png";
import rectangle from "./Rectangle 11.png";
import Group14 from "./Group 14.png";
import "./Hospitaldashboard.css";
import { useState } from "react";
//import Axios from "axios";
const tableElements = {
  border: "1px solid black",
  borderCollapse: "collapse",
  columnWidth: "500px",
  paddingTop: "5px",
  paddingBottom: "5px",
  paddingLeft: "5px",
  paddingRight: "5px",
};

function Blooddashboard() {

  return (
    <div>
      <div className="row">
       {/* column 1 */}
        <div className="column1" 
          style={{
            backgroundColor:"#F0A8AE"
          }}>
    
    <div class='odinMainContainer'>
  {/* <!-- Left Sidebar Area[upper] --> */}
  <div class='odinLeftSidebarContainer'>
    <div className="rowlogo">
    <br />
  <div className="columnlogo1" style={{backgroundColor:"#F0A8AE"}}>
    <img style={{width:"95%",height:"100%"}} src={logo1}/>
  </div>
  <div class="columnlogo2" style={{backgroundColor:""}}>
   <h1 style={{fontSize:"23px",opacity:"80%",margin:"0px"}}>LifeLine</h1>
   <p style={{margin:"0px"}}>Save a Life<br/>Give Blood</p>
    
    
  </div>
</div>
  </div>
  
  {/* Left Sidebar Area[Lower] */}
  <div class='odinMainContentContainer'>
  <hr style={{ padding:"0px" , margin:"0px" , backgroundColor:"black" }}/>
  <div style={{paddingTop:"70px",paddingLeft:"40px"}}>
  <a style={{color: "black",textDecoration: "none",fontSize: "20px",textDecoration: "none",padding: "10px",opacity: "10px",}} href="/">Profile</a><br /><br /> <br />
  <a  style={{color: "black",textDecoration: "none",fontSize: "20px",textDecoration: "none",padding: "10px",opacity: "10px",}} href="/BloodBankLogin/BloodBankDashboard/BloodRequirements">Blood Requirements</a>
    
                <br /><br />
                <br />
                <a  style={{
                    color: "black",
                    textDecoration: "none",
                    fontSize: "20px",
                    textDecoration: "none",
                    padding: "10px",
                    opacity: "10px",
                  }}
                  href="/BloodBankLogin/BloodBankDashboard/DonorInformation"
                >
                  Donor Information
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
                  href="/BloodBankLogin/BloodBankDashboard/StockAvailable"
                >
                 Stock Available
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
                  href="/BloodBankLogin/BloodBankDashboard/AddDonor"
                >
                  Add Donar
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
                </a><br /><br /><br /><br /></div>
  </div>
</div>
  </div>

  {/* column 2 */}
  <div className="column2" 
    style={{
      backgroundColor:""
    }}>
    <div class='odinMainContainer11'>
  {/* <!-- Left Sidebar Area --> */}
  <div class='odinLeftSidebarContainer1'>
 
  <div class="container">
 
  <img style={{opacity:"60%"}} src={bgimage}/>
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
  
  <img style={{margin:"60px",width:"90%",height:"80%"}} src={Group14}/>
  </div>
</div>
  </div>
</div>
    </div>
  );
}

export default Blooddashboard;
