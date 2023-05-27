const { Schema, model } = require("mongoose");
const ProductSchema = new Schema({
  title: { type: String, require: [true, "title is require"] },
  description: { type: String, default: "" },
  category: { type: Schema.Types.ObjectId, ref: "Category", require: true },
  price: { type: Number, require: true },
  image: { type: Array, default: [] },
  createdOn: { type: Date },
  updateOn: { type: Date },
});

ProductSchema.pre("save", function (next) {
  this.updateOn = new Date();
  this.createdOn = new Date();
  next();
});

ProductSchema.pre(["update", "findOneAndUpdate", "updateOne"], function (next) {
  const update = this.getUpdate();
  delete update._id;
  this.updateOn = new Date();
  next();
});

const ProductModel = model("Product", ProductSchema);
module.exports = ProductModel;
