const CardModel = require("./../models/card_model");

const CardController = {
  getCard: async function (req, res) {
    try {
      const user = req.query.user;

      const foundCard = await CardModel.find({ user: user });

      if (!foundCard) {
        return res.json({
          success: true,
          message: "card is empty",
          data: [],
        });
      }

      return res.json({
        success: true,
        message: "card list",
        data: foundCard,
      });
    } catch (ex) {
      return res.json({
        success: false,
        message: ex.message,
      });
    }
  },
  addToCard: async function (req, res) {
    try {
      const { product, user, quantity } = req.body;
      const foundUser = await CardModel.findOne({ user: user });
      if (!foundUser) {
        const newCart = new CardModel({ user: user });
        newCart.items.push({
          product: product,
          quantity: quantity,
        });
        await newCart.save();
        return res.json({
          success: true,
          message: "product add to card",
          data: newCart,
        });
      }

      const updateCard = await CardModel.findOneAndUpdate(
        { user: user },
        { $push: { items: { product: product, quantity: quantity } } },
        { new: true }
      );

      return res.json({
        success: true,
        message: "product add to card",
        data: updateCard,
      });
    } catch (ex) {
      return res.json({ success: false, message: ex.message });
    }
  },
  removeToCard: async function (req, res) {
    try {
      const { product, user } = req.body;
      const card = await CardModel.findOneAndUpdate(
        { user: user },
        { $pull: { items: { product: product } } },
        { new: true }
      );

      return res.json({
        success: true,
        message: "product remove to card",
        data: card,
      });
    } catch (ex) {
      return res.json({ success: false, message: ex.message });
    }
  },
};

module.exports = CardController;
