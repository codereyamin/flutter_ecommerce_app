const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const morgan = require("morgan");
const helmet = require("helmet");
const core = require("cors");
const app = express();
const PORT = process.env.PORT || 5000;

// core data use
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(morgan("dev"));
app.use(helmet());
app.use(core());

//DB connection
//mongoose.connect("mongodb://localhost:27017");//mongodb://127.0.0.1/my_database
//mongoose.connect("mongodb://127.0.0.1/test");//mongodb://127.0.0.1/my_database
mongoose
  .connect("mongodb://127.0.0.1:27017/test")
  .then(() => console.log("Db Connected!"));

// user data use
const UserRoutes = require("./routes/user_route");
app.use("/api/user", UserRoutes);

//Category
const CategoryRoutes = require("./routes/category_routes");
app.use("/api/category", CategoryRoutes);

//product
const ProductRoutes = require("./routes/product_routes");
app.use("/api/product", ProductRoutes);

//card
const CardsRoutes = require("./routes/card_routes");
app.use("/api/cards", CardsRoutes);

//order
const OrderRoutes = require("./routes/order_routes");
app.use("/api/order", OrderRoutes);
// server listen
app.listen(PORT, () => {
  console.log(`server is running ${PORT}`);
});
