import logo1 from "./logo1.png";
import { useNavigate } from "react-router-dom";
import ab from "./AB+.png";
import "./request.css";
import { useState } from "react";
import { db } from "./firebase-config";
import { collection, addDoc } from "firebase/firestore";
//import Axios from "axios";

function BloodRequest() {
  const navigate = useNavigate();
  const navigateToHospitalDashboard = () => {
    navigate("/HospitalLogin/HospitalDashboard");
  };
  const ref = collection(db, "hospital_blood_request");

  function addDocument(newData) {
    return addDoc(ref, newData);
  }
  const [patientName, setPatientName] = useState("");
  const [bloodType, setBloodType] = useState("");
  const [age, setAge] = useState("");
  const [bloodUnitsReq, setBloodUnitsReq] = useState("");
  const [contactNo, setContactNo] = useState("");
  const [status, setStatus] = useState("");
  const [hospitalName, setHospitalName] = useState("");
  const [date, setDate] = useState("");

  const handleSubmit = async (e) => {
    const newData = {
      patientName,
      hospitalName,
      date,
      bloodType,
      age,
      bloodUnitsReq,
      contactNo,
      status,
    };
    console.log(newData);
    try {
      await addDocument(newData);
      console.log("succesfully added to firestore");
    } catch (e) {
      console.log(e);
      console.log("not added to firestore");
    }
    setPatientName("");
    setBloodType("");
    setAge("");
    setBloodUnitsReq("");
    setStatus("");
    setHospitalName("");
    setDate("");
    document.getElementById("form1").reset();
  };
  const onOptionChange = (e) => {
    setStatus(e.target.value);
  };

  return (
    <div>
      <div className="r">
        <div className="leftx">
          <div className="c_r">
            <div className="c1_r1">
              <div className="c1_r1_c">
                <div className="r1_c1">
                  <img src={logo1} />
                </div>
                <div className="r1_c2">
                  <h1>Lifeline</h1>
                  <p>Give Blood</p>
                </div>
              </div>
            </div>
            <div className="c1_r2">
              <h2 style={{ fontSize: "10px" }}>REQUEST FOR BLOOD </h2>
              <p>Fill in the details to request blood from blood bank</p>
            </div>
            <div className="c1_r3">
              <img style={{ width: "400px", height: "280px" }} src={ab} />
            </div>
            <div className="c1_r4">
              <div className="container1">
                <button id="btn1"  onClick={
                  () => {
                    return navigateToHospitalDashboard();}}>Return to Dashboard</button>
              </div>
            </div>
          </div>
        </div>
        <div className="rightx">
          <div className="odinMain">
            {/* Left Sidebar Area */}
            <div
              class="odinLeftSidebar"
              style={{
                marginTop: "20px",
                marginBottom: "0px",
                marginLeft: "20px",
              }}
            >
              <form id="form1">
                <label className="hospitalname" for="cnum">
                  Patient Name
                </label>
                <br />
                <input
                  className="form_field"
                  style={{ width: "30%" }}
                  type="text"
                  id="patientName"
                  name="pname"
                  onChange={(e) => setPatientName(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Hospital Name
                </label>
                <br />
                <input
                  className="form_field"
                  style={{ width: "30%" }}
                  type="text"
                  id="patientName"
                  name="pname"
                  onChange={(e) => setHospitalName(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Date
                </label>
                <br />
                <input
                  className="form_field"
                  style={{ width: "30%" }}
                  type="text"
                  id="patientName"
                  name="pname"
                  onChange={(e) => setDate(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Blood Type
                </label>
                <br />
                <input
                  className="form_field"
                  type="text"
                  id="bloodType"
                  name="btype"
                  style={{ width: "30%" }}
                  onChange={(e) => setBloodType(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Patient Age
                </label>
                <br />
                <input
                  className="form_field"
                  type="text"
                  id="age"
                  name="page"
                  style={{ width: "30%" }}
                  onChange={(e) => setAge(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Blood Unit Required
                </label>
                <br />
                <input
                  className="form_field"
                  type="text"
                  id="bloodUnitsReq"
                  name="bunit"
                  style={{ width: "30%" }}
                  onChange={(e) => setBloodUnitsReq(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Contact Number
                </label>
                <br />
                <input
                  className="form_field"
                  type="text"
                  id="contactNo"
                  name="cnum"
                  style={{ width: "30%" }}
                  onChange={(e) => setContactNo(e.target.value)}
                />
                <br />
              </form>
            </div>
            <div className="main">
              {/* Main Content Area  */}
              <div
                style={{
                  marginTop: "20px",
                  marginBottom: "0px",
                  marginLeft: "20px",
                }}
              >
                <h2 style={{ margin: "0px" }}>Blood request Type</h2>
                <hr />
                <div className="bloodrequesttyperow">
                  <div className="bloodrequesttypecolumn">
                    <label className="container">
                      <input
                        type="radio"
                        name="status"
                        value="Emergency"
                        onChange={(e) => setStatus(e.target.value)}
                      />
                      <b>Emergency</b>{" "}
                      <i style={{ opacity: "60%" }}>[Immediately]</i>
                      <span className="checkmark"></span>
                    </label>
                    <br />
                    <label className="container">
                      <input
                        type="radio"
                        name="status"
                        value="Urgent"
                        onChange={(e) => setStatus(e.target.value)}
                      />
                      <b>Urgent</b>{" "}
                      <i style={{ opacity: "60%" }}>[Within an hour]</i>
                      <span className="checkmark"></span>
                    </label>
                  </div>
                  <div className="column00">
                    <label className="container">
                      <input
                        type="radio"
                        checked="checked"
                        name="status"
                        value="Standard"
                        onChange={(e) => setStatus(e.target.value)}
                      />
                      <b>Standard</b>{" "}
                      <i style={{ opacity: "60%" }}>[within 8 hr]</i>
                      <span className="checkmark"></span>
                    </label>
                    <br />
                    <label className="container">
                      <input
                        type="radio"
                        name="status"
                        value="Group and Save"
                        onChange={(e) => setStatus(e.target.value)}
                      />
                      <b>Group and Save</b>{" "}
                      <i style={{ opacity: "60%" }}>[within 7 days]</i>
                      <span className="checkmark"></span>
                    </label>
                    <button
                      id="submitbutton"
                      onClick={() => {
                        handleSubmit();
                        setPatientName("");
                        setBloodType("");
                        setAge("");
                        setBloodUnitsReq("");
                        setContactNo("");
                        setStatus("");
                        setDate("");
                        setHospitalName("");
                        console.log(status);
                      }}
                    >
                      Submit
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default BloodRequest;
