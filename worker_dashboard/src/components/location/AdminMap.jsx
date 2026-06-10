"use client";

import { useEffect, useState } from "react";

import {
  MapContainer,
  TileLayer,
  Polygon,
  Marker,
  Popup,
} from "react-leaflet";

import L from "leaflet";
import "../../lib/leafletFix";
// 🔶 Office Geo-Fence Polygon
const polygon = [
  [17.190614, 78.505090],
  [17.189687, 78.503955],
  [17.190666, 78.504246],
  [17.1906738, 78.503525],
];

// 🟢 INSIDE MARKER
const insideIcon = new L.Icon({
  iconUrl:
    "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-green.png",

  shadowUrl:
    "https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/images/marker-shadow.png",

  iconSize: [25, 41],
  iconAnchor: [12, 41],
});

// 🔴 OUTSIDE MARKER
const outsideIcon = new L.Icon({
  iconUrl:
    "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png",

  shadowUrl:
    "https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/images/marker-shadow.png",

  iconSize: [25, 41],
  iconAnchor: [12, 41],
});

export default function AdminMap() {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    const fetchUsers = async () => {
      try {
        // 🔥 Fetch live employee data
        const res = await fetch(
          window.API_BASE + "/api/presence"
        );

        const data = await res.json();

        // ✅ Keep latest location for each employee
        const latest = {};

        data.forEach((item) => {
          if (
            !latest[item.employee_id] ||
            item.id > latest[item.employee_id].id
          ) {
            latest[item.employee_id] = item;
          }
        });

        const latestUsers = Object.values(latest);

        console.log("LIVE USERS:", latestUsers);

        setUsers(latestUsers);
      } catch (err) {
        console.error("Fetch error:", err);
      }
    };

    // 🚀 Initial fetch
    fetchUsers();

    // 🔄 Auto refresh
    const interval = setInterval(fetchUsers, 3000);

    return () => clearInterval(interval);
  }, []);

  return (
    <MapContainer
      center={polygon[0]}
      zoom={19}
      style={{
        height: "500px",
        width: "100%",
      }}
    >
      {/* 🛰 Satellite Map */}
      <TileLayer
        url="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"
      />

      {/* 🔶 Geo Fence */}
      <Polygon
        positions={polygon}
        pathOptions={{
          color: "yellow",
          weight: 5,
          fillColor: "yellow",
          fillOpacity: 0.3,
        }}
      />

      {/* 📍 Employee Markers */}
      {users.map((user, index) => (
  <Marker
    key={user.employee_id}
    position={[
      Number(user.lat) + index * 0.00001,
      Number(user.lng) + index * 0.00001,
    ]}
    icon={
      user.status === "outside"
        ? outsideIcon
        : insideIcon
    }
  >
    <Popup>
      <div>
        <strong>
          Employee: {user.employee_id}
        </strong>

        <br />

        Status: {user.status}

        <br />

        Lat:
        {" "}
        {Number(user.lat).toFixed(6)}

        <br />

        Lng:
        {" "}
        {Number(user.lng).toFixed(6)}
      </div>
    </Popup>
  </Marker>
))}
    </MapContainer>
  );
}