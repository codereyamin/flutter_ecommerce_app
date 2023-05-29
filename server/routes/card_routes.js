const CardRoutes = require("express").Router();
const CardController = require("./../controllers/card_controller");
CardRoutes.post("/add", CardController.addToCard);
CardRoutes.get("/get", CardController.getCard);
CardRoutes.delete("/remove", CardController.removeToCard);
module.exports = CardRoutes;
