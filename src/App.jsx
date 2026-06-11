  import React, { useState } from "react";
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import "leaflet/dist/leaflet.css";
// Pages
import Login from "./pages/Login";
import Signup from "./pages/Signup";
import ForgotPassword from "./pages/ForgotPassword";
import ResetPassword from "./pages/ResetPassword";
import Dashboard from "./pages/Dashboard";
import Profile from "./pages/Profile";
import UserManagement from "./pages/UserManagement";
import LocationsManagement from "./pages/LocationsManagement";
import WorkerManagementTable from "./pages/Workermanagement";
// import WorkerLiveMap from "./components/location/WorkerLiveMap";

import TaskManagement from "./pages/TaskManagement";
import InventoryManagement from "./pages/InventoryManagement";

import Feedback from "./pages/Feedback";
import AttendancePayroll from "./pages/Attendance";
import AlertsManagement from "./pages/AlertsManagement";
import Reports from "./pages/Reports";

// Layout
import ShellLayout from "./layout/ShallLayout.jsx";

function App() {

  

  // const isLoggedIn = !!localStorage.getItem("token");
  // const setIsLoggedIn = (trueOrFalse) => {
  //   if (!trueOrFalse) {
  //     localStorage.removeItem("token");
  //     localStorage.removeItem("name");
  //   }
  // };
const [isLoggedIn, setIsLoggedIn] = useState(
  !!localStorage.getItem("token")
);

  return (
    <BrowserRouter>
      <Routes>

        {/* LOGIN */}
        <Route
          path="/login"
          element={
            isLoggedIn ? (
              <Navigate to="/dashboard"/>
            ) : (
              <Login onLogin={() => setIsLoggedIn(true)} />
            )
          }
        />

        <Route path="/signup" element={<Signup />} />
        <Route path="/forgot-password" element={<ResetPassword />} />

        {/* RESET PASSWORD   */}
<Route
  path="/reset-password/:token"
  element={<ResetPassword />}
/>
        {/* PROFILE */}
        <Route
          path="/profile"
          element={
            isLoggedIn ? (
              <ShellLayout>
                <Profile />
              </ShellLayout>
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />


        {/* DASHBOARD */}

<Route
          path="/dashboard"
          element={
            isLoggedIn ? (
              <ShellLayout>
                <Dashboard />
              </ShellLayout>
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />   


        {/* USER MANAGEMENT */}
        <Route
          path="/users"
          element={
            isLoggedIn ? (
              <ShellLayout>
                <UserManagement />
              </ShellLayout>
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />

        {/* LOCATIONS */}
        <Route
          path="/locations"
          element={
            isLoggedIn ? (
              <ShellLayout>
                <LocationsManagement />
              </ShellLayout>
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />

        {/* WORKER MANAGEMENT */}
        <Route
          path="/workermanagement"
          element={
            isLoggedIn ? (
              <ShellLayout>
                <WorkerManagementTable />
              </ShellLayout>
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />

        {/* TASK MANAGEMENT */}
        <Route
          path="/tasks"
          element={
            isLoggedIn ? (
              <ShellLayout>
                <TaskManagement />
              </ShellLayout>
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />

        {/* INVENTORY */}
        <Route
          path="/inventory"
          element={
            isLoggedIn ? (
              <ShellLayout>
                <InventoryManagement />
              </ShellLayout>
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />



        {/* ATTENDANCE / PAYROLL */}
        <Route
          path="/attendance"
          element={
            isLoggedIn ? (
              <ShellLayout>
                <AttendancePayroll />
              </ShellLayout>
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />

      


        {/* REPORTS */}
        <Route
          path="/reports"
          element={
            isLoggedIn ? (
              <ShellLayout>
                <Reports />
              </ShellLayout>
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />

        {/* FEEDBACK */}
        <Route
          path="/feedback"
          element={
            isLoggedIn ? (
              <ShellLayout>
                <Feedback />
              </ShellLayout>
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />

        {/* ALERTS */}
        <Route
          path="/alerts"
          element={
            isLoggedIn ? (
              <ShellLayout>
                <AlertsManagement />
              </ShellLayout>
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />
    

        {/* DEFAULT REDIRECT */}
        <Route path="*" element={<Navigate to="/login" replace />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
