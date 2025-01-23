const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const dotenv = require("dotenv");
const User = require("./models/userModel");
dotenv.config(); // Load environment variables
const cors = require("cors");
const app = express();
const PORT = 3000;
const bcrypt = require("bcrypt");
// Middleware
// CORS Middleware
app.use(
  cors({
    origin: "*",
    credentials: true,
    methods: ["*"],
    allowedHeaders: ["*"],
  })
);
app.use(bodyParser.json());
console.log("oombuuu");
// MongoDB Connection
const connectToMongo = async () => {
  try {
    await mongoose.connect(
      "mongodb+srv://sreepriyanth2005:JQftPu5vWjbZ9ob8@cluster0.kd5ut.mongodb.net/myDatabase?retryWrites=true&w=majority&appName=Cluster0",
      { useNewUrlParser: true, useUnifiedTopology: true }
    );
    console.log("Connected to MongoDB Atlas");
  } catch (err) {
    console.error("MongoDB connection error:", err);
    process.exit(1); // Stop the server if MongoDB connection fails
  }
};

// Call MongoDB connection function
connectToMongo();

// Routes
// 1. Register a new user
app.post("/register", async (req, res) => {
  console.log("register");
  const { userName, email, phoneNumber, password } = req.body;

  if (!phoneNumber || !password || !userName || !email) {
    return res.status(400).json({ message: "required" });
  }

  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    const user = new User({
      userName,
      email,
      phoneNumber,
      password: hashedPassword,
    });
    await user.save();
    res.status(201).json({ message: "registered" });
  } catch (error) {
    console.error("Error registering user:", error);
    if (error.code === 11000) {
      res.status(409).json({ message: "exists" });
    } else {
      res.status(500).json({ message: "Error registering user.", error });
    }
  }
});

// 2. Login

app.post("/login", async (req, res) => {
  console.log("login");

  const { identifier, password } = req.body;

  if (!identifier || !password) {
    return res.status(400).json({ message: "User and password are required." });
  }

  try {
    const user = await User.findOne({
      $or: [
        { email: identifier },
        { phoneNumber: identifier },
        { userName: identifier },
      ],
    });

    console.log("user", user);

    if (!user) {
      return res.status(404).json({ message: "New" });
    }

    // Compare hashed password
    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      return res.status(401).json({ message: "Invalid" });
    }
    const userObj = {
      userName: user.userName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      message: "Login",
    };
    res.status(200).json(userObj);
  } catch (error) {
    console.error("Error logging in:", error); // Log the error details
    res.status(500).json({ message: "Error logging in.", error });
  }
});

// Start server with try-catch block
try {
  app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
  });
} catch (error) {
  console.error("Error starting the server:", error); // Log server start error
  process.exit(1); // Exit the process if the server fails to start
}
