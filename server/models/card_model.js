const { Schema, model } = require("mongoose");

const cartItemSchema = new Schema({
  product: { type: Schema.Types.ObjectId, ref: "Product" },
  quantity: { type: Number, default: 1 },
});
const CardSchema = new Schema({
  user: { type: Schema.Types.ObjectId, ref: "User", required: true },
  items: { type: [cartItemSchema], default: [] },
  createOn: { type: Date },
  updateOn: { type: Date },
});

CardSchema.pre("save", function (next) {
  (this.createOn = new Date()), (this.updateOn = new Date()), next();
});
CardSchema.pre(["update", "findOneAndUpdate", "updateOne"], function (next) {
  const update = this.getUpdate();
  delete update._id;
  this.updateOn = new Date();
  next();
});

const CardModel = model("CardModel", CardSchema);
module.exports = CardModel;
