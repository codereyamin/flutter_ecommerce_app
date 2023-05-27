const CategoryModel = require("./../models/category_model");
const CategoryController = {
  createCategory: async function (req, res) {
    try {
      const categoryData = req.body;
      const newCategoryData = new CategoryModel(categoryData);
      await newCategoryData.save();
      return res.json({
        success: true,
        message: "category create",
        data: newCategoryData,
      });
    } catch (ex) {
      return res.json({
        success: false,
        message: ex.message,
      });
    }
  },

  fetchAllCategory: async function (req, res) {
    try {
      const category = await CategoryModel.find();

      return res.json({
        success: true,
        data: category,
      });
    } catch (ex) {
      return res.json({
        success: false,
        message: ex.message,
      });
    }
  },
  fetchCategoryById: async function (req, res) {
    try {
      const reqId = req.params.id;
      const foundCategory = await CategoryModel.findById(reqId);

      if (!foundCategory) {
        return res.json({
          success: false,
          message: "Category not found!",
        });
      }
      return res.json({
        success: true,
        data: foundCategory,
      });
    } catch (ex) {
      return res.json({
        success: false,
        message: ex.message,
      });
    }
  },
};

module.exports = CategoryController;
