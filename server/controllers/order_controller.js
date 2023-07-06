const OrderModel = require("./../models/orders_model");
const orderController = {
  createOrder: async function (req, res) {
    try {
      const { user, items } = req.body;
      const newOrder = new OrderModel({
        user: user,
        items: items,
      });
      await newOrder.save();

      return res.json({
        success: true,
        message: "order created!",
        data: newOrder,
      });
    } catch (error) {
      return res.json({ success: false, message: error });
    }
  },

  fetchOrderForUser: async function (req, res) {
    try {
      const userId = req.params.userId;
      const foundUserOrder = await OrderModel.find({
        "user.id": userId,
      });
      return res.json({
        success: true,
        data: foundUserOrder,
      });
    } catch (error) {
      console.log(error);
      return res.json({
        success: false,
        message: error,
      });
    }
  },

  updateOrderStatus: async function (req, res) {
    try {
      const { orderId, status } = req.body;
      const updateOrder = await OrderModel.findOneAndUpdate(
        { _id: orderId },
        { status: status },
        { new: true }
      );
      return res.json({
        success: true,
        data: updateOrder,
      });
    } catch (error) {
      return res.json({
        success: false,
        message: error,
      });
    }
  },
};
module.exports = orderController;
