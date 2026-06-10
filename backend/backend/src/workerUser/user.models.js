const pool = require("./config/db");

const userSchema = new mongoose.Schema({
  name: String,
  role: String,
  email: String,
  phone: String,
  employeeId: String,
  location: String,
  colo: String,
  shift: String,
  joinedOn: String,
  password: String,

  loginHistory: [
    {
      date: String,
      device: String,
    },
  ],
});

export default mongoose.model("User", userSchema);