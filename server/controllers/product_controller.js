const ProductModel = require("./../models/product_model");

const ProductController = {
  createProduct: async function (req, res) {
    try {
      const productModel = req.body;
      const newProduct = ProductModel(productModel);
      await newProduct.save();
      return res.json({
        success: true,
        message: "Product created!",
        data: newProduct,
      });
    } catch (ex) {
      return res.json({
        success: false,
        message: ex.message,
      });
    }
  },
  fetchAllProduct: async function (req, res) {
    try {
      const product = await ProductModel.find();
      res.json({
        success: true,
        data: product,
      });
    } catch (ex) {
      return res.json({
        success: false,
        message: ex.message,
      });
    }
  },
  fetchProductById: async function (req, res) {
    try {
      const id = req.params.id;
      const product = await ProductModel.findById(id);
      if (!product) {
        res.json({
          success: false,
          message: "Product not found!",
        });
      }
      res.json({
        success: true,
        data: product,
      });
    } catch (ex) {
      return res.json({
        success: false,
        message: ex.message,
      });
    }
  },

  fetchProductByCategory: async function (req, res) {
    try {
      const id = req.params.id;
      const product = await ProductModel.find({ category: id });
      if (!product) {
        res.json({
          success: false,
          message: "Product not found!",
        });
      }
      res.json({
        success: true,
        data: product,
      });
    } catch (ex) {
      return res.json({
        success: false,
        message: ex.message,
      });
    }
  },
};

module.exports = ProductController;
