const ProductRoutes = require("express").Router();
const ProductController = require("./../controllers/product_controller");
ProductRoutes.get("/", ProductController.fetchAllProduct);
ProductRoutes.get("/category/:id", ProductController.fetchProductByCategory);
ProductRoutes.get("/:id", ProductController.fetchProductById);
ProductRoutes.post("/", ProductController.createProduct);
module.exports = ProductRoutes;
