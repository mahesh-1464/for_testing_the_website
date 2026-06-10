"use client";

import { useEffect, useState } from "react";

import {
  MapContainer,
  TileLayer,
  Polygon,
  Marker,
  Popup,
  useMap,
} from "react-leaflet";

import "@/lib/leafletFix";

// 🔶 Office Polygon
const polygon = [
  [17.190614, 78.505090],
  [17.189687, 78.503955],
  [17.190666, 78.504246],
  [17.1906738, 78.503525],
];

// 📍 Auto move map
function ChangeView({ position }) {
  const map = useMap();

  useEffect(() => {
    if (position) {
      map.setView(position, 20);
    }
  }, [position, map]);

  return null;
}

export default function MapView() {
  const [position, setPosition] = useState(null);
  const [users, setUsers] = useState([]);

  // 🔥 Current employee
 const params =
  new URLSearchParams(window.location.search);

const employeeId =
  params.get("emp") || "E001";
console.log("EMPLOYEE:", employeeId);
  // 📍 Track current device + SAVE TO DB
  useEffect(() => {
    const watchId =
      navigator.geolocation.watchPosition(
        async (pos) => {
          const lat = pos.coords.latitude;
          const lng = pos.coords.longitude;

          // 🔥 Update local position
          setPosition([lat, lng]);

          // 🔥 Simple status logic
          const status = "inside";

          console.log(
            "Sending:",
            employeeId,
            lat,
            lng
          );

          // 🔥 SAVE TO BACKEND
          try {
            const res = await fetch(
              window.API_BASE + "/api/location",
              {
                method: "POST",

                headers: {
                  "Content-Type":
                    "application/json",
                },

                body: JSON.stringify({
                  employeeId,
                  lat,
                  lng,
                  status,
                }),
              }
            );

            const data = await res.json();

            console.log(
              "Saved to DB:",
              data
            );
          } catch (err) {
            console.error(
              "POST ERROR:",
              err
            );
          }
        },

        (err) => console.error(err),

        {
          enableHighAccuracy: true,
          maximumAge: 0,
          timeout: 5000,
        }
      );

    return () =>
      navigator.geolocation.clearWatch(watchId);
  }, []);

  // 🔥 Fetch all employees
  useEffect(() => {
    const fetchUsers = async () => {
      try {
        const res = await fetch(
          window.API_BASE + "/api/presence"
        );

        const data = await res.json();

        // ✅ Keep latest row only
        const latest = {};

        data.forEach((item) => {
          if (
            !latest[item.employee_id] ||
            item.id > latest[item.employee_id].id
          ) {
            latest[item.employee_id] = item;
          }
        });

        const latestUsers =
          Object.values(latest);

        console.log(
          "LIVE USERS:",
          latestUsers
        );

        setUsers(latestUsers);
      } catch (err) {
        console.error(
          "Fetch error:",
          err
        );
      }
    };

    // Initial fetch
    fetchUsers();

    // 🔄 Auto refresh
    const interval =
      setInterval(fetchUsers, 3000);

    return () =>
      clearInterval(interval);
  }, []);

  return (
    <MapContainer
      center={polygon[0]}
      zoom={18}
      style={{
        height: "500px",
        width: "100%",
      }}
    >
      {/* 🛰 Satellite View */}
      <TileLayer
        url="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"
      />

      {/* 🔶 Office Polygon */}
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
      {users.map((user) => (
        <Marker
          key={user.employee_id}
          position={[
            Number(user.lat),
            Number(user.lng),
          ]}
        >
          <Popup>
            <div>
              <strong>
                Employee:
                {" "}
                {user.employee_id}
              </strong>

              <br />

              Status:
              {" "}
              {user.status}

              <br />

              Lat:
              {" "}
              {Number(user.lat).toFixed(6)}

              <br />

              Lng:
              {" "}
              {Number(user.lng).toFixed(6)}

              <br />

              Time:
              {" "}
              {new Date(
                user.created_at
              ).toLocaleTimeString()}
            </div>
          </Popup>
        </Marker>
      ))}

      {/* 📍 Auto Center */}
      {position && (
        <ChangeView
          position={position}
        />
      )}
    </MapContainer>
  );
}