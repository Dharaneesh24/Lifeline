import "./styles.css";
import { useNavigate } from "react-router-dom";
import "./Hospitaldashboard.css";

function SignUp() {
  const navigate = useNavigate();
  const navigateToAdminDashboard = () => {
    navigate("/Login/Hospitaldashboard");
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
              href="/Login"
            >
              Hospital
            </a>
            <a href="/Loginbloodbank">Bloodbank</a>
          </div>
        </div>
        <div className="text-block1">
          <h2 style={{ opacity: "100%" }}>New User </h2>
          <div>
            <form>
              <input type="text" placeholder="Email" onChange={(event) => {}} />

              <input
                type="Password"
                placeholder="Password"
                onChange={(event) => {}}
              />

              <input
                type="Password"
                placeholder="Confirm Password"
                onChange={(event) => {}}
              />
              <br />
              <button
                className="loginbutton"
                type="button"
                onClick={
                  () => {
                    return navigateToAdminDashboard();
                  }
                  //navigateToHospitalDashboard
                }
              >
                Sign Up
              </button>
              <br />
              <br />

              <h4>
                <b>
                  Already have an account?
                  <br />
                  <a href="/Login">LOG IN</a>
                </b>
              </h4>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}

export default SignUp;
