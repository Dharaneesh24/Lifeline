import "./styles.css";
import { useNavigate } from "react-router-dom";
import "./Hospitaldashboard.css";
import GoogleButton from "react-google-button";
import { useEffect } from "react";
import {db} from "./firebase-config";
import { useState } from "react";
import { collection, getDocs } from "firebase/firestore";



function HospitalLogin() {
  const navigate = useNavigate();
  const navigateToHospitalDashboard = () => {
    navigate("/HospitalLogin/HospitalDashboard");
  };
  const [emailStr, setEmailStr] = useState("");
  const [passwordStr, setPasswordStr] = useState("");
  const [bb_hospital_markers, setbb_hospital_markers] = useState([]);
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
    setbb_hospital_markers(data.docs.map((doc) => ({ ...doc.data(), id: doc.id })));
  };
  return (
    <div>
      <div className="bg">
        <div className="containers">
          <div className="topnav2">
            <a
              style={{
                textDecoration: "underline",
                fontSize: "20px",
                fontWeight: "bold",
              }}
              href="/HospitalLogin"
            >
              Hospital
            </a>
            <a href="/BloodBankLogin">Bloodbank</a>
          </div>
        </div>
        <div className="text-block1">
          <h2 style={{ opacity: "100%" }}>WELCOME BACK </h2>
          <div>
            <form>
              <input type="text" placeholder="Email" onChange={(event) => { setEmailStr(event.target.value)}} />
              <br />
              <br />
              <input
                type="Password"
                placeholder="Password"
                onChange={(event) => { setPasswordStr(event.target.value) }}
              />
              <br />
              <br />
              <a style={{ fontSize: "14px", textDecoration: "None" }} href="">
                Forgot Password
              </a>
              <br />

              <br />
              <button
                className="loginbutton"
                type="button"
                onClick={
                  () => {
                    console.log(bb_hospital_markers); // return navigateToHospitalDashboard();
                    {bb_hospital_markers.map((doc, index) => {
                     if(doc.email === emailStr&&doc.password===passwordStr&&doc.color=="red"){return navigateToHospitalDashboard();}
                  })}
                  }
                  //navigateToHospitalDashboard
                }
              >
                Sign in
              </button>
              <br />
              <br />
              {/* <div><GoogleButton className="g-btn" type="dark" /></div> */}
              <h4>
                <b>
                  Don't have an account?
                  <br />
                  <a href="">Sign Up</a>
                </b>
              </h4>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}

export default HospitalLogin;
