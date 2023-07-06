const { Schema, model } = require("mongoose");

const orderItemSchema = new Schema({
  product: { type: Map, require: true },
  quantity: { type: Number, default: 1 },
});
const OrderSchema = new Schema({
  user: { type: Map, required: true },
  items: { type: [orderItemSchema], default: [] },
  status: { type: String, default: "order place" },
  createOn: { type: Date },
  updateOn: { type: Date },
});

OrderSchema.pre("save", function (next) {
  (this.createOn = new Date()), (this.updateOn = new Date()), next();
});
OrderSchema.pre(["update", "findOneAndUpdate", "updateOne"], function (next) {
  const update = this.getUpdate();
  delete update._id;
  this.updateOn = new Date();
  next();
});

const OrderModel = model("OrderModel", OrderSchema);
module.exports = OrderModel;
