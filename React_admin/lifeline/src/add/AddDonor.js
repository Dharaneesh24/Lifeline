import logo1 from "./logo1.png";
import { useNavigate } from "react-router-dom";
import ab from "./AB+.png";
import "./Hospitaldashboard.css";
import { useState } from "react";
import { db } from "./firebase-config";
import { collection, addDoc } from "firebase/firestore";
//import Axios from "axios";

function AddDonor() {
  const navigate = useNavigate();
  const navigateToBloodbankDashboard = () => {
    navigate("/BloodBankLogin/BloodBankDashboard");
  };
  const ref = collection(db, "donors");

  function addDocument(newData) {
    return addDoc(ref, newData);
  }
  // const [patientName, setPatientName] = useState("");
  // const [bloodType, setBloodType] = useState("");
  // const [age, setAge] = useState("");
  // const [bloodUnitsReq, setBloodUnitsReq] = useState("");
  // const [contactNo, setContactNo] = useState("");
  // const [status, setStatus] = useState("");
  // const [hospitalName, setHospitalName] = useState("");
  // const [date, setDate] = useState("");
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [address, setAddress] = useState("");
  const [dob, setDob] = useState("");
  const [phone_no, setPhone_no] = useState("");
  const [blood_grp, setBlood_grp] = useState("");
  const [latitude, setLatitude] = useState("10.95555555");
  const [longitude, setLongitude] = useState("76.9700000");

  const handleSubmit = async (e) => {
    const newData = {
      name,
      email,
      password,
      address,
      dob,
      phone_no,
      blood_grp,
      latitude,
      longitude,
    };
    console.log(newData);
    try {
      await addDocument(newData);
      console.log("succesfully added to firestore");
    } catch (e) {
      console.log(e);
      console.log("not added to firestore");
    }
    setName("");
    setEmail("");
    setPassword("");
    setAddress("");
    setDob("");
    setPhone_no("");
    setBlood_grp("");
    document.getElementById("form1").reset();
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
              <h2 style={{ fontSize: "18px" }}>Add Donor </h2>
              <p>Fill in the details to add a donor into the system</p>
            </div>
            <div className="c1_r3">
              <img style={{ width: "400px", height: "280px" }} src={ab} />
            </div>
            <div className="c1_r4">
              <div className="container1">
                <button
                  id="btn1"
                  onClick={() => {

                    return navigateToBloodbankDashboard();
                                      }}
                >
                  Return to Dashboard
                </button>
              </div>
            </div>
          </div>
        </div>
        <div className="rightx">
          <div className="odinMain">
            {/* Left Sidebar Area */}
            <div
              className="odinLeftSidebar"
              style={{
                marginTop: "20px",
                marginBottom: "0px",
                marginLeft: "20px",
              }}
            >
              <form id="form1">
                <label className="hospitalname" for="cnum">
                  Donor Name
                </label>
                <br />
                <input
                  className="form_field"
                  style={{ width: "30%" }}
                  type="text"
                  id="name"
                  name="name"
                  onChange={(e) => setName(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Donor Email
                </label>
                <br />
                <input
                  className="form_field"
                  style={{ width: "30%" }}
                  type="text"
                  id="email"
                  name="email"
                  onChange={(e) => setEmail(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Password
                </label>
                <br />
                <input
                  className="form_field"
                  style={{ width: "30%" }}
                  type="text"
                  id="pw"
                  name="pw"
                  onChange={(e) => setPassword(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Address
                </label>
                <br />
                <input
                  className="form_field"
                  type="text"
                  id="addr"
                  name="addr"
                  style={{ width: "30%" }}
                  onChange={(e) => setAddress(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Date of Birth
                </label>
                <br />
                <input
                  className="form_field"
                  type="text"
                  id="age"
                  name="page"
                  style={{ width: "30%" }}
                  onChange={(e) => setDob(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Phone No
                </label>
                <br />
                <input
                  className="form_field"
                  type="text"
                  id="ph_no"
                  name="pn_no"
                  style={{ width: "30%" }}
                  onChange={(e) => setPhone_no(e.target.value)}
                />
                <br />
                <label className="hospitalname" for="cnum">
                  Blood Group
                </label>
                <br />
                <input
                  className="form_field"
                  type="text"
                  id="bg"
                  name="bg"
                  style={{ width: "30%" }}
                  onChange={(e) => setBlood_grp(e.target.value)}
                />
                <br />
              </form>
            </div>
            <div className="">
              {/* Main Content Area  */}
              <div
                style={{
                  marginTop: "20px",
                  marginBottom: "0px",
                  marginLeft: "20px",
                }}
              >
                <button
                  id="submitbutton"
                  onClick={() => {
                    handleSubmit();
                    setName("");
                    setEmail("");
                    setPassword("");
                    setAddress("");
                    setDob("");
                    setPhone_no("");
                    setBlood_grp("");
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
  );
}

export default AddDonor;
