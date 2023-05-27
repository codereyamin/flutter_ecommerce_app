const { Schema, model } = require("mongoose");

const categorySchema = new Schema({
  title: {
    type: String,
    require: [true, "title is required"],
  },
  description: {
    type: String,
    default: "",
  },
  updatedOn: {
    type: Date,
  },
  createOn: {
    type: Date,
  },
});
categorySchema.pre("save", function (next) {
  this.updatedOn = new Date();
  this.createOn = new Date();
  next();
});
categorySchema.pre(
  ["update", "findOneAndUpdate", "updateOne"],
  function (next) {
    const update = this.getUpdate();
    delete update._id;

    this.updateOn = new Date();
    next();
  }
);
const CategoryModel = model("Category", categorySchema);
module.exports = CategoryModel;
