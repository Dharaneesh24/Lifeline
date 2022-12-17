import { BrowserRouter as Router, Route, Routes } from "react-router-dom";

import HospitalDashboard from "./add/HospitalDashboard";
import BloodRequest from "./add/BloodRequest";
import BloodBankLogin from "./add/BloodBankLogin";
import BloodBankDashboard from "./add/BloodBankDashboard";
import SignUp from "./add/SignUp";
import HospitalLogin from "./add/HospitalLogin";
import LocationTracking from "./add/LocationTracking";
import BloodBankDetails from "./add/BloodBankDetails";
import BloodRequirements from "./add/BloodRequirements";
import DonorInformation from "./add/DonorInformation";
import StockAvailable from "./add/StockAvailable";
import AddDonor from "./add/AddDonor";
import TempGMaps from "./add/TempGMaps";

function App() {
  return (
    <Router>
      <Routes>
        <Route exact path="/" element={<HospitalLogin />} />
        
        {/* Hospital */}
        <Route exact path="/HospitalLogin" element={<HospitalLogin />} />
        <Route
          exact
          path="/HospitalLogin/HospitalDashboard"
          element={<HospitalDashboard />}
        />
        <Route
          exact
          path="/HospitalLogin/HospitalDashboard/BloodRequest"
          element={<BloodRequest />}
        />
        <Route
          exact
          path="/HospitalLogin/HospitalDashboard/LocationTracking"
          element={<LocationTracking />}
        />
        <Route
          exact
          path="/HospitalLogin/HospitalDashboard/BloodBankDetails"
          element={<BloodBankDetails />}
        />



        {/* BloodBank */}
        <Route exact path="/BloodBankLogin" element={<BloodBankLogin />} />
        <Route
          exact
          path="/BloodBankLogin/BloodBankDashboard"
          element={<BloodBankDashboard />}
        />
        <Route
          exact
          path="/BloodBankLogin/BloodBankDashboard/BloodRequirements"
          element={<BloodRequirements />}
        />
        <Route
          exact
          path="/BloodBankLogin/BloodBankDashboard/DonorInformation"
          element={<DonorInformation />}
        />
        <Route
          exact
          path="/BloodBankLogin/BloodBankDashboard/StockAvailable"
          element={<StockAvailable />}
        />
        <Route
          exact
          path="/BloodBankLogin/BloodBankDashboard/AddDonor"
          element={<AddDonor />}
        />
        
        <Route exact path="/TempGMaps" element={<TempGMaps />} />
      </Routes>
    </Router>
  );
}

export default App;
