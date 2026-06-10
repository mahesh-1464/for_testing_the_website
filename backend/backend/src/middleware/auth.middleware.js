

const jwt = require("jsonwebtoken");

const authenticateToken = (req, res, next) => {
  const authHeader = req.headers.authorization;

  if (!authHeader) {
    return res.status(401).json({ message: "Token missing" });
  }

  const token = authHeader.split(" ")[1];

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);

    console.log("DECODED TOKEN:", decoded); // debug

    console.log("JWT_SECRET:", process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (err) {
    console.error("TOKEN ERROR:", err.message);
    return res.status(403).json({ message: "Invalid token" });
  }
};

module.exports = authenticateToken; // const authorizeRoles = (...allowedRoles) => {
//   return (req, res, next) => {
//     if (!req.user || !allowedRoles.includes(req.user.role)) {
//       return res.status(403).json({
//         message: "Access denied. Insufficient permissions."
//       });
//     }
//     next();
//   };
// };

// module.exports = authorizeRoles;
