import "./styles.css";
import { useNavigate } from "react-router-dom";
import "./Hospitaldashboard.css";
import Blooddashboard from "./BloodBankDashboard.js";
import { useState, useEffect } from "react";
import { db } from "./firebase-config";
import { collection, getDocs } from "firebase/firestore";

function BloodBankLogin() {
  const navigate = useNavigate();
  const navigateTobloodDashboard = () => {
    navigate("/BloodBankLogin/BloodBankDashboard");
  };

  const [emailStr, setEmailStr] = useState("");
  const [passwordStr, setPasswordStr] = useState("");
  const [BBloginList, setBBLoginList] = useState("");

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
      <div className="bg">
        <div className="containers">
          <div className="topnav2">
            <a href="../">Hospital</a>
            <a
              style={{
                textDecoration: "underline",
                fontSize: "20px",
                fontWeight: "bold",
              }}
            >
              Bloodbank
            </a>
          </div>
        </div>
        <div className="text-block1">
          <h2 style={{ opacity: "100%" }}>WELCOME BACK </h2>
          <div>
            <form>
              <input
                type="text"
                placeholder="Email"
                onChange={(event) => {
                  setEmailStr(event.target.value);
                }}
              />
              <br />
              <br />
              <input
                type="Password"
                placeholder="Password"
                onChange={(event) => {
                  setPasswordStr(event.target.value);
                }}
              />
              <br />
              <a href="">Forgot Password</a>
              <br />
              <br />
              <button
                className="loginbutton"
                type="button"
                onClick={
                  () => {
                    console.log(BBloginList);
                    {
                      BBloginList.map((doc, index) => {
                        console.log(123);
                        if (
                          (doc.email === emailStr) &
                          (doc.password === passwordStr) &
                          (doc.color === "orange")
                        ) {
                          console.log(345);
                          return navigateTobloodDashboard();
                        }
                        // return (
                        //   <tr key={doc.id}>
                        //     <td>{doc.name}</td>
                        //     <td>{doc.email}</td>
                        //     <td>{doc.blood_grp}</td>

                        //     <td>{doc.dob}</td>
                        //     <td>{doc.phone_no}</td>
                        //     <td>{doc.address}</td>
                        //   </tr>
                        // );
                      });
                    }
                    //return navigateTobloodDashboard();
                  }
                  //navigateToHospitalDashboard
                }
              >
                Sign in
              </button>
              <br />
              <br />

              <h4>
                <b>
                  Don't have an account?
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

export default BloodBankLogin;
